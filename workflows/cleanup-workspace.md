# 阶段 5: 工作区清理工作流

此工作流负责在开发完成后清理工作区,释放磁盘空间。

## 触发条件

- 用户调用 `/multi-repo-dev clean`
- 阶段 4 (提交与推送) 完成后自动询问
- 用户说 "清理工作区" 或类似表达

## 执行步骤

### Step 1: 列出可清理的需求

扫描工作区目录,找出所有已完成的需求:

```bash
WORKSPACE="${config.workspace}"
cd "${WORKSPACE}"

# 查找所有需求目录
for req_dir in REQ-*/; do
  if [ -f "${req_dir}/.meta.json" ]; then
    # 读取状态
    status=$(jq -r '.status // .requirement.status // "unknown"' "${req_dir}/.meta.json")

    if [ "$status" = "completed" ]; then
      echo "可清理: ${req_dir}"
    fi
  fi
done
```

### Step 2: 展示清理选项

使用 `AskUserQuestion` 让用户选择清理策略:

**问题**: "检测到 X 个已完成的需求工作区,如何处理?"

**选项**:
1. **完全删除** - 删除整个需求目录 (文档+代码)
   - 描述: 彻底清理,释放最多空间,适合已归档的需求
   - 优点: 释放最多磁盘空间
   - 缺点: 无法查看历史文档

2. **仅删除代码** - 只删除 repos/ 目录,保留文档
   - 描述: 保留需求文档和实现方案,方便日后查阅
   - 优点: 保留历史记录,释放大部分空间
   - 缺点: 需要时需重新克隆代码

3. **不清理** - 保留所有内容
   - 描述: 暂时不清理,稍后再处理
   - 优点: 最安全,不会丢失任何内容
   - 缺点: 占用磁盘空间

### Step 3: 安全检查

在执行删除前,检查每个需求:

```bash
check_safety() {
  local req_dir=$1

  # 检查是否有未提交的更改
  for project_dir in "${req_dir}/repos/"*/; do
    if [ -d "${project_dir}/.git" ]; then
      cd "${project_dir}"

      # 检查 git status
      if ! git diff --quiet || ! git diff --cached --quiet; then
        echo "⚠️  警告: ${project_dir} 有未提交的更改"
        return 1
      fi

      # 检查是否已推送
      local branch=$(git branch --show-current)
      if [ -n "$branch" ]; then
        local unpushed=$(git log origin/${branch}..${branch} --oneline 2>/dev/null | wc -l)
        if [ $unpushed -gt 0 ]; then
          echo "⚠️  警告: ${project_dir} 有 ${unpushed} 个未推送的提交"
          return 1
        fi
      fi
    fi
  done

  return 0
}
```

### Step 4: 计算磁盘占用

显示将要释放的空间:

```bash
calculate_size() {
  local req_dir=$1
  local clean_mode=$2

  if [ "$clean_mode" = "full" ]; then
    du -sh "${req_dir}" | cut -f1
  elif [ "$clean_mode" = "repos-only" ]; then
    du -sh "${req_dir}/repos" 2>/dev/null | cut -f1 || echo "0"
  fi
}
```

### Step 5: 执行清理

根据用户选择执行清理:

```bash
cleanup_workspace() {
  local req_dir=$1
  local clean_mode=$2

  case "$clean_mode" in
    full)
      # 完全删除
      echo "🗑️  完全删除: ${req_dir}"
      rm -rf "${req_dir}"

      # 记录到日志
      echo "[$(date)] 完全删除: ${req_dir}" >> "${WORKSPACE}/CLEANED.log"
      ;;

    repos-only)
      # 仅删除代码
      echo "🗑️  删除代码: ${req_dir}/repos"
      rm -rf "${req_dir}/repos"

      # 更新 .meta.json
      jq '.cleanedAt = now | .cleanedMode = "repos-only"' \
        "${req_dir}/.meta.json" > "${req_dir}/.meta.json.tmp"
      mv "${req_dir}/.meta.json.tmp" "${req_dir}/.meta.json"

      # 记录到日志
      echo "[$(date)] 删除代码: ${req_dir}" >> "${WORKSPACE}/CLEANED.log"
      ;;

    skip)
      echo "⏭️  跳过: ${req_dir}"
      ;;
  esac
}
```

### Step 6: 批量清理

如果有多个需求,可以批量处理:

```bash
# 收集所有已完成的需求
completed_reqs=()
for req_dir in "${WORKSPACE}"/REQ-*/; do
  if [ -f "${req_dir}/.meta.json" ]; then
    status=$(jq -r '.status // .requirement.status // "unknown"' "${req_dir}/.meta.json")
    if [ "$status" = "completed" ]; then
      completed_reqs+=("$req_dir")
    fi
  fi
done

# 显示统计
echo "📊 清理统计:"
echo "  - 已完成需求: ${#completed_reqs[@]} 个"

# 逐个处理
for req_dir in "${completed_reqs[@]}"; do
  check_safety "$req_dir"
  if [ $? -eq 0 ]; then
    cleanup_workspace "$req_dir" "$clean_mode"
  else
    echo "⚠️  跳过 ${req_dir} (有未提交/未推送的更改)"
  fi
done
```

### Step 7: 输出清理报告

```
✅ 工作区清理完成!

📊 清理统计:
  - 已处理需求: 5 个
  - 完全删除: 3 个
  - 仅删除代码: 2 个
  - 跳过: 0 个
  - 释放空间: 1.2 GB

📝 清理日志: /Users/xxx/Project/requirements/CLEANED.log

保留的文档:
  - REQ-20260401-frontend-update (仅文档)
  - REQ-20260401-network-inner-optimization (仅文档)
```

## 交互示例

### 示例 1: 自动触发 (阶段 4 完成后)

```
Claude: "代码已成功推送到远程! 🎉

检测到当前工作区: REQ-20260402-activity-instance-count-fix
占用磁盘空间: 120 MB (其中代码 110 MB)

是否清理此工作区?"

[完全删除] [仅删除代码] [暂不清理]
```

### 示例 2: 手动清理

```
用户: "/multi-repo-dev clean"

Claude: "扫描工作区中..."

发现 5 个已完成的需求:

1. REQ-20260401-frontend-update (120 MB)
2. REQ-20260401-network-inner-optimization (85 MB)
3. REQ-20260330-stress-test-integration (156 MB)
4. REQ-20260331-fix-mail-validation-error (42 MB)
5. REQ-20260401-restore-ticket-page-style (78 MB)

总计: 481 MB

如何处理这些工作区?"

[批量完全删除] [批量仅删除代码] [逐个选择] [取消]
```

## 安全保障

1. **防止误删**:
   - 只清理状态为 `completed` 的需求
   - 检查是否有未提交的更改
   - 检查是否有未推送的提交
   - 显示即将删除的内容和大小

2. **可恢复性**:
   - 保留文档选项 (仅删除代码)
   - 记录清理历史到 `CLEANED.log`
   - 在 `.meta.json` 中记录清理时间

3. **用户确认**:
   - 使用 `AskUserQuestion` 明确询问
   - 显示清理影响和后果
   - 提供取消选项

## 配置选项

在 `config.json` 中添加清理配置:

```json
{
  "cleanup": {
    "autoPrompt": true,              // 阶段 4 完成后自动询问
    "defaultMode": "repos-only",      // 默认清理模式
    "keepDays": 7,                    // 保留最近 N 天的工作区
    "minDiskSpace": "1GB"             // 磁盘空间低于此值时自动提示
  }
}
```

## 错误处理

- **有未提交更改**: 显示警告,跳过清理,提示用户先提交
- **有未推送提交**: 显示警告,跳过清理,提示用户先推送
- **删除失败**: 显示错误信息,建议手动检查权限
- **工作区不存在**: 提示没有可清理的内容

## 实现提示

1. 使用 `Bash` 执行文件操作和 git 检查
2. 使用 `Read` 读取 `.meta.json` 获取状态
3. 使用 `AskUserQuestion` 与用户交互
4. 使用 `jq` 处理 JSON 数据
5. 记录详细的清理日志供审计
