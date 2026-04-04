# Multi-Repo-Dev Skill 完整设置指南

## 🎉 已完成的工作

✅ Skill 已创建并注册到项目的 `skills.json`
✅ 所有必需文件已就绪
✅ 配置模板和文档已准备

## 📁 文件结构

```
.skills/multi-repo-dev/
├── skill.md                      # ⭐ 主入口
├── package.json                  # 包信息
├── config.example.json           # 配置示例
├── .gitignore                    # Git 忽略规则
├── README.md                     # 使用文档
├── INSTALL.md                    # 安装指南
├── SETUP_GUIDE.md               # 本文件
├── quickstart.sh                 # 🚀 快速配置脚本
├── REQUIREMENT_TEMPLATE.md       # 需求文档模板
├── IMPLEMENTATION_TEMPLATE.md    # 实现方案模板
├── .meta.template.json           # 元数据模板
└── workflows/
    └── init-requirement.md       # 初始化工作流

项目根目录:
├── skills.json                   # ✅ 已注册 multi-repo-dev
```

## 🚀 快速开始

### 方式 1: 自动配置 (推荐)

```bash
cd .skills/multi-repo-dev
./quickstart.sh
```

这个脚本会:
1. ✅ 复制配置示例
2. ✅ 自动检测当前项目
3. ✅ 设置工作区路径
4. ✅ 验证配置格式

### 方式 2: 手动配置

```bash
cd .skills/multi-repo-dev
cp config.example.json config.json
vim config.json
```

## ⚙️ 配置说明

### 最小配置

```json
{
  "projects": {
    "yone-cmdb": {
      "repo": "git@gitlab.com:xxx/yone-cmdb.git",
      "branch": "master"
    }
  },
  "workspace": "/Users/yonsun/Project/requirements"
}
```

### 完整配置

```json
{
  "projects": {
    "yone-cmdb": {
      "repo": "git@gitlab.com:xxx/yone-cmdb.git",
      "branch": "master",
      "localPath": "/Users/yonsun/Project/Yone-CMDB-ALL/yone-cmdb",
      "tech": ["Go", "Vue", "MySQL"],
      "description": "CMDB 主项目"
    },
    "cmdb-agent": {
      "repo": "git@gitlab.com:xxx/cmdb-agent.git",
      "branch": "main",
      "localPath": "/Users/yonsun/Project/cmdb-agent",
      "tech": ["Go"],
      "description": "CMDB Agent"
    }
  },
  "workspace": "/Users/yonsun/Project/requirements",
  "settings": {
    "autoCreateBranch": true,
    "branchPrefix": "feature/",
    "commitPrefix": "feat",
    "autoTest": true,
    "requireApproval": {
      "beforeImplement": true,
      "beforePush": true
    }
  }
}
```

### 配置项说明

#### `projects` (必填)

每个项目包含:
- `repo` **(必填)** - Git 仓库地址
- `branch` **(必填)** - 默认分支
- `localPath` *(可选)* - 本地路径(有的话会直接使用,避免重复克隆)
- `tech` *(可选)* - 技术栈标签
- `description` *(可选)* - 项目描述

#### `workspace` (必填)

需求工作区根目录,每个需求会在这里创建子目录。

#### `settings` (可选)

- `autoCreateBranch` - 是否自动创建开发分支 (默认: true)
- `branchPrefix` - 分支前缀 (默认: "feature/")
- `commitPrefix` - Commit 前缀 (默认: "feat")
- `autoTest` - 是否自动运行测试 (默认: true)
- `requireApproval` - 需要确认的环节
  - `beforeImplement` - 实现前确认 (默认: true)
  - `beforePush` - 推送前确认 (默认: true)

## ✅ 验证安装

### 1. 检查文件

```bash
ls -l .skills/multi-repo-dev/skill.md
ls -l .skills/multi-repo-dev/config.json
```

### 2. 验证配置格式

```bash
cd .skills/multi-repo-dev
cat config.json | jq .
```

如果没有 `jq`:
```bash
python3 -m json.tool config.json
```

### 3. 检查注册

```bash
cat skills.json | grep multi-repo-dev
```

应该看到:
```json
"multi-repo-dev": "./.skills/multi-repo-dev"
```

## 🎯 开始使用

### 在 Claude Code 中

```bash
# 方式 1: 使用命令
/multi-repo-dev start

# 方式 2: 自然语言
"我要开发一个新需求,涉及 yone-cmdb 和 cmdb-agent"

# 方式 3: 恢复已有需求
/multi-repo-dev resume REQ-20260326-feature-name
```

### 完整工作流示例

```
你: "我要给 yone-cmdb 添加批量导入功能"

Claude:
📝 [阶段 1: 初始化]
1. 创建工作区: REQ-20260326-batch-import
2. 拉取 yone-cmdb 最新代码
3. 创建分支: feature/batch-import
4. 初始化文档

✅ 工作区创建成功!

📁 阅读代码中...
- 分析导入模块
- 检查数据验证逻辑
- 查看现有 API

🤝 [阶段 2: 需求对齐]
我分析了代码,有几个问题需要确认:
1. 批量导入支持哪些格式? (Excel/CSV/JSON)
2. 单次最大导入数量?
3. 失败数据如何处理?

(你回答问题...)

📋 [生成实现方案]
- 新增 API: POST /api/hosts/batch-import
- 修改文件: handlers/host.go, models/host.go
- 新增文件: services/batch_import.go
- 测试计划: 单元测试 + 集成测试

方案看起来如何?

你: "可以,开始开发"

🔨 [阶段 3: 开发实现]
- ✅ 实现批量导入 API
- ✅ 添加数据验证
- ✅ 编写单元测试
- ✅ 测试通过

📦 [阶段 4: 提交推送]
- 整理 commits
- 推送到 feature/batch-import
- 创建 MR

✅ 完成!
```

## 🔧 自定义

### 修改模板

```bash
# 编辑需求文档模板
vim .skills/multi-repo-dev/REQUIREMENT_TEMPLATE.md

# 编辑实现方案模板
vim .skills/multi-repo-dev/IMPLEMENTATION_TEMPLATE.md
```

### 添加自定义工作流

```bash
# 创建新的工作流文件
vim .skills/multi-repo-dev/workflows/custom-workflow.md
```

### 扩展功能

可以在 `skill.md` 中添加:
- 自定义钩子
- 集成 CI/CD
- 通知机制
- 代码审查规则

## 📚 文档

- **README.md** - 完整使用指南
- **INSTALL.md** - 安装说明
- **skill.md** - Skill 详细说明
- **workflows/** - 各阶段工作流文档

## ❓ 常见问题

### Q: 为什么要用 localPath?

A: 如果项目已在本地,提供 `localPath` 可以:
- 避免重复克隆 (节省时间和空间)
- 直接使用本地最新代码
- 支持软链接到现有仓库

### Q: 工作区会占用很多空间吗?

A: 取决于你的配置:
- 使用 `localPath` + 软链接: 几乎不占用额外空间
- 克隆代码: 每个需求一份完整代码
- 建议: 定期清理已完成的需求工作区

### Q: 可以跨多个项目开发吗?

A: 可以! 这正是这个 skill 的核心功能:
```
"我要开发跨 3 个项目的需求"
```
会创建包含所有项目的工作区。

### Q: 支持 monorepo 吗?

A: 支持! 可以将 monorepo 作为一个项目:
```json
{
  "projects": {
    "my-monorepo": {
      "repo": "git@github.com:xxx/monorepo.git",
      "branch": "main",
      "tech": ["TypeScript", "React", "Node.js"]
    }
  }
}
```

### Q: 可以集成到 CI/CD 吗?

A: 可以! 工作区结构标准化,易于集成:
```yaml
# .gitlab-ci.yml
test:
  script:
    - cd ${WORKSPACE}/repos/project-a
    - npm test
```

## 🐛 故障排查

### 问题: Git 认证失败

```bash
# 检查 SSH 密钥
ssh -T git@gitlab.com

# 如果失败,配置密钥
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub  # 添加到 GitLab
```

### 问题: 配置文件不生效

```bash
# 验证 JSON 格式
cd .skills/multi-repo-dev
cat config.json | jq .

# 检查路径
ls -l config.json
```

### 问题: Skill 未加载

```bash
# 检查注册
cat skills.json | jq '.skills["multi-repo-dev"]'

# 应该输出: "./.skills/multi-repo-dev"
```

## 🎓 最佳实践

1. **配置管理**
   - `config.json` 不要提交到 Git (已在 .gitignore)
   - 团队可共享 `config.example.json`

2. **分支命名**
   - 使用有意义的名称: `feature/user-login`
   - 与需求 ID 保持一致

3. **Commit 规范**
   - 遵循 Conventional Commits
   - 一个 commit 对应一个逻辑改动

4. **工作区管理**
   - 定期清理已完成的需求
   - 重要需求可以保留作为参考

5. **文档更新**
   - 开发过程中及时更新文档
   - 记录重要决策和变更原因

## 🚀 进阶使用

### 与其他 Skills 集成

```json
// 配合 rush-fix
"我要用 multi-repo-dev 开发需求,然后用 rush-fix 创建修复任务"

// 配合 dbpaas-platform
"开发过程中需要查询数据库,用 dbpaas-platform"
```

### 自定义工作流

参考 `workflows/init-requirement.md` 创建自己的工作流。

### 团队协作

可以扩展支持:
- 通知机制 (Slack/钉钉)
- 任务分配
- Code Review 流程

## 📞 获取帮助

遇到问题?
1. 查看 README.md
2. 检查 INSTALL.md
3. 在 Claude Code 中询问: "multi-repo-dev skill 怎么用?"

## 🎉 开始你的第一个需求!

```bash
# 运行快速配置
cd .skills/multi-repo-dev
./quickstart.sh

# 然后在 Claude Code 中
/multi-repo-dev start
```

祝你开发愉快! 🚀
