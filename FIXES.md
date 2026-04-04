# 问题修复记录

## v1.1.0 - 元数据格式标准化

### 问题描述

`/multi-repo-dev list` 命令无法正确解析元数据，原因：

1. **元数据格式不统一** - 不同工作区使用了不同的 JSON 结构
2. **模板过时** - `.meta.template.json` 与实际使用的格式不一致
3. **缺少验证** - 没有元数据格式验证机制

### 解决方案

#### 1. 统一元数据格式

标准格式（`.meta.template.json`）：

```json
{
  "version": "1.0",
  "requirementId": "REQ-20260404-example",
  "name": "需求名称",
  "description": "需求描述",
  "createdAt": "2026-04-04T10:00:00Z",
  "updatedAt": "2026-04-04T12:00:00Z",
  "status": "in_progress",
  "projects": [
    {
      "name": "project-name",
      "baseBranch": "master",
      "devBranch": "feature/xxx",
      "tech": ["Go", "Vue"]
    }
  ],
  "workspace": "/absolute/path/to/workspace",
  "branches": {
    "project-name": "feature/xxx"
  },
  "commits": {
    "project-name": "abc123"
  }
}
```

**字段说明**：
- `version`: 元数据格式版本（方便未来升级）
- `requirementId`: 唯一标识符
- `name`: 需求名称
- `description`: 需求描述
- `createdAt/updatedAt`: ISO 8601 时间戳
- `status`: `in_progress` | `completed` | `archived`
- `projects`: 项目数组（对象格式）
- `workspace`: 工作区绝对路径
- `branches`: 项目分支映射
- `commits`: 最新提交哈希

#### 2. 改进 list 命令

更新 SKILL.md 中的 list 命令逻辑：

```bash
# 兼容多种格式
jq -r '
  .requirementId,
  (.projects | if type == "array" then
    if .[0] | type == "object" then
      [.[].name] | join(", ")
    else
      join(", ")
    end
  else
    . | to_entries | map(.key) | join(", ")
  end),
  .status // "unknown",
  .createdAt // "N/A"
'
```

#### 3. 添加验证

在工作区创建时验证元数据：

```bash
# 验证 JSON 格式
if ! jq empty .meta.json 2>/dev/null; then
  echo "错误: 元数据格式无效"
  exit 1
fi

# 验证必填字段
required_fields=("requirementId" "createdAt" "status" "projects")
for field in "${required_fields[@]}"; do
  if ! jq -e ".$field" .meta.json >/dev/null; then
    echo "错误: 缺少必填字段 $field"
    exit 1
  fi
done
```

### 影响

- ✅ 所有新创建的工作区将使用统一格式
- ✅ `list` 命令可以正确解析元数据
- ⚠️ 旧工作区需要手动迁移（或使用迁移脚本）

### 迁移指南

对于旧工作区，可以使用以下脚本转换：

```bash
#!/bin/bash
# migrate-meta.sh - 迁移旧元数据到新格式

for meta in */\.meta.json; do
  echo "处理: $meta"

  # 备份
  cp "$meta" "$meta.backup"

  # 转换格式
  jq '{
    version: "1.0",
    requirementId: .requirementId,
    name: (.name // .requirementId),
    description: (.description // ""),
    createdAt: .createdAt,
    updatedAt: (now | todate),
    status: .status,
    projects: (if .projects | type == "array" then .projects else [.projects | to_entries[] | {name: .key, baseBranch: .value.baseBranch, devBranch: .value.branch}] end),
    workspace: .workspace,
    branches: (.branches // {}),
    commits: (.commits // {})
  }' "$meta" > "$meta.new"

  mv "$meta.new" "$meta"
done
```

---

## 后续改进计划

1. [ ] 在 SKILL.md 中强制使用 `.meta.template.json`
2. [ ] 添加元数据验证函数
3. [ ] 创建迁移脚本
4. [ ] 更新文档说明元数据格式
