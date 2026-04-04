# 阶段 1: 需求初始化工作流

此工作流负责创建需求工作区、拉取代码并初始化文档。

## 触发条件

- 用户调用 `/multi-repo-dev start`
- 用户说 "开始新需求" 或类似表达

## 执行步骤

### Step 1: 检查配置

```javascript
// 伪代码
if (!exists("config.json")) {
  if (exists("config.example.json")) {
    askUser("是否基于 config.example.json 创建配置?")
  } else {
    guideUserToCreateConfig()
  }
  exit()
}

config = readConfig("config.json")
validateConfig(config)
```

### Step 2: 收集需求信息

使用 `AskUserQuestion` 收集:

1. **需求名称** (kebab-case, 例如: `auto-sync-hosts`)
2. **涉及项目** (多选, 从 config.projects 中选择)
3. **需求简述** (一句话描述)

### Step 3: 创建工作区

```bash
# 生成需求 ID
REQ_ID="REQ-$(date +%Y%m%d)-${requirement_name}"
WORKSPACE="${config.workspace}/${REQ_ID}"

# 创建目录结构
mkdir -p "${WORKSPACE}/repos"
cd "${WORKSPACE}"
```

### Step 4: 拉取项目代码

对每个选中的项目:

```bash
PROJECT_NAME="xxx"
REPO_URL="${config.projects[PROJECT_NAME].repo}"
BASE_BRANCH="${config.projects[PROJECT_NAME].branch}"

cd "${WORKSPACE}/repos"

# 如果本地路径存在,使用软链接或拷贝
if [ -d "${config.projects[PROJECT_NAME].localPath}" ]; then
  # 方案 A: 软链接 (节省空间)
  ln -s "${config.projects[PROJECT_NAME].localPath}" "${PROJECT_NAME}"

  # 方案 B: 拷贝 (独立工作区)
  # cp -r "${config.projects[PROJECT_NAME].localPath}" "${PROJECT_NAME}"
else
  # 克隆代码
  git clone "${REPO_URL}" "${PROJECT_NAME}"
fi

cd "${PROJECT_NAME}"

# 切换到基础分支并拉取最新
git checkout "${BASE_BRANCH}"
git pull origin "${BASE_BRANCH}"

# 创建开发分支
FEATURE_BRANCH="${config.settings.branchPrefix}${requirement_name}"
git checkout -b "${FEATURE_BRANCH}"
```

### Step 5: 初始化文档

```bash
# 生成需求文档
cp "${SKILL_DIR}/REQUIREMENT_TEMPLATE.md" "${WORKSPACE}/REQUIREMENT.md"

# 替换占位符
sed -i '' "s/{REQUIREMENT_NAME}/${requirement_name}/g" "${WORKSPACE}/REQUIREMENT.md"
sed -i '' "s/{DATE}/$(date +%Y-%m-%d)/g" "${WORKSPACE}/REQUIREMENT.md"
sed -i '' "s/{PROJECTS}/${selected_projects}/g" "${WORKSPACE}/REQUIREMENT.md"

# 生成实现方案文档
cp "${SKILL_DIR}/IMPLEMENTATION_TEMPLATE.md" "${WORKSPACE}/IMPLEMENTATION.md"

# 替换占位符
sed -i '' "s/{REQUIREMENT_NAME}/${requirement_name}/g" "${WORKSPACE}/IMPLEMENTATION.md"
sed -i '' "s/{DATE}/$(date +%Y-%m-%d)/g" "${WORKSPACE}/IMPLEMENTATION.md"
```

### Step 6: 创建元数据

```bash
# 生成 .meta.json
cp "${SKILL_DIR}/.meta.template.json" "${WORKSPACE}/.meta.json"

# 填充项目信息
# (使用 jq 或类似工具修改 JSON)
```

### Step 7: 输出结果

```
✅ 需求工作区创建成功!

📁 工作区路径: ${WORKSPACE}
📝 需求文档: ${WORKSPACE}/REQUIREMENT.md
🔧 实现方案: ${WORKSPACE}/IMPLEMENTATION.md

涉及项目:
  - ${PROJECT_1} (${FEATURE_BRANCH})
  - ${PROJECT_2} (${FEATURE_BRANCH})

下一步:
  1. 我将阅读代码理解现有架构
  2. 与你对齐需求细节
  3. 生成详细实现方案

是否开始阶段 2: 代码理解与需求对齐?
```

## 错误处理

- **工作区已存在**: 询问是否恢复或覆盖
- **Git 操作失败**: 提示检查 SSH 密钥和权限
- **配置无效**: 给出具体错误信息和修复建议

## 输出

- 工作区路径
- 元数据对象 (传递给下一阶段)

## 实现提示

1. 使用 `Bash` 执行 git 和文件操作
2. 使用 `Write` 生成文档 (而不是 sed)
3. 使用 `AskUserQuestion` 交互
4. 使用 `Read` 读取配置和模板
