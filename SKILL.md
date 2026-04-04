---
name: multi-repo-dev
description: 多仓库需求开发完整工作流,支持跨项目协同开发、需求对齐、代码实现和提交推送。当用户要开发新需求、创建跨项目工作区或进行多仓库开发任务时使用此 skill。
---

# Multi-Repo Development Workflow

完整的多仓库需求开发工作流 skill，从需求初始化到代码提交的全流程自动化。

## 使用场景

当用户说类似以下内容时触发:
- "我要开发一个新需求，涉及 X、Y 项目"
- "帮我创建一个跨项目需求工作区"
- "开始一个多仓库开发任务"

## 工作流程

### 阶段 0: 配置检查

首先检查 `config.json` 是否存在并有效:

```json
{
  "projects": {
    "project-name": {
      "repo": "git@gitlab.com:group/project.git",        // 必填: Git 仓库地址
      "branch": "master",                                 // 必填: 默认分支
      "localPath": "/absolute/path/to/project",           // 可选: 本地路径 (推荐留空,每次从 Git 拉取最新)
      "tech": ["Go", "Vue"],                              // 可选: 技术栈
      "description": "项目描述"                            // 可选: 项目描述
    }
  },
  "workspace": "/path/to/requirements/workspace"
}
```

**配置说明**:
- `repo` (必填): Git 仓库 SSH 地址
- `branch` (必填): 默认分支名 (master/main)
- `localPath` (可选): 本地路径,**推荐留空**,让系统每次从 Git 克隆最新代码
- `tech` (可选): 技术栈标签,帮助 AI 理解项目
- `description` (可选): 项目描述

如果不存在，引导用户创建配置。

### 阶段 1: 需求初始化

1. **询问信息**:
   - 需求名称 (用于创建工作区目录)
   - 涉及的项目列表 (从 config.json 中选择)
   - 需求简述

2. **创建工作区**:
   ```bash
   workspace/
   └── REQ-{date}-{name}/
       ├── REQUIREMENT.md          # 需求文档
       ├── IMPLEMENTATION.md       # 实现方案
       ├── repos/                  # 项目代码
       │   ├── project-a/
       │   └── project-b/
       └── .meta.json              # 元数据
   ```

3. **拉取代码**:
   - **如果配置了 `localPath`**: 使用本地路径,执行 `git pull` 更新到最新
   - **如果未配置 `localPath`**: 从远程仓库 `git clone` 最新代码到工作区
   - 创建开发分支 (例如: `feature/{requirement-name}`)

   **重要**:
   - 默认行为是从 Git 拉取最新代码,确保代码始终是最新的
   - 本地路径 (`localPath`) 是可选的,用于节省克隆时间

### 阶段 2: 代码理解与需求对齐

1. **深度代码分析**:
   - 使用 `Agent` + `Explore` 探索项目结构
   - 识别关键文件、模块、API
   - 分析现有架构模式

2. **需求对齐对话**:
   - 与用户确认需求细节
   - 讨论技术方案
   - 评估改动影响范围

3. **生成文档**:
   - 更新 `REQUIREMENT.md`:
     - 需求背景
     - 功能描述
     - 验收标准
   - 生成 `IMPLEMENTATION.md`:
     - 架构设计
     - 改动文件清单
     - 测试计划
     - 分步实施 checklist

### 阶段 3: 开发实现

1. **按照 IMPLEMENTATION.md 逐步实现**:
   - 使用 `TaskCreate` 创建任务列表
   - 逐个完成任务
   - 及时更新文档状态

2. **本地测试**:
   - 运行单元测试
   - 执行集成测试
   - 手动验证关键流程

3. **代码审查**:
   - 自我审查代码质量
   - 检查是否符合现有规范
   - 确保无安全漏洞

### 阶段 4: 提交与推送

1. **Commit 整理**:
   - 检查每个项目的 `git status`
   - 使用 semantic commit message
   - 必要时使用 `git rebase -i` 压缩 commits

2. **推送代码**:
   - 推送到远程分支
   - 记录分支信息到 `.meta.json`

3. **可选后续**:
   - 创建 MR/PR
   - 通知相关人员
   - 更新项目管理系统

### 阶段 5: 工作区清理

开发完成并推送代码后,询问用户是否清理工作区:

1. **清理选项**:
   - **完全删除**: 删除整个需求目录 (包括文档和代码)
   - **仅删除代码**: 只删除 `repos/` 目录,保留文档作为记录
   - **保留全部**: 不删除任何内容

2. **安全检查**:
   - 确认所有更改已提交 (git status 干净)
   - 确认已推送到远程 (git push 成功)
   - 显示将要删除的内容和大小

3. **执行清理**:
   ```bash
   # 完全删除
   rm -rf /path/to/REQ-xxx/

   # 仅删除代码
   rm -rf /path/to/REQ-xxx/repos/
   ```

4. **清理后记录**:
   - 更新 `.meta.json` 的 `cleanedAt` 时间戳
   - 在工作区根目录创建 `CLEANED.log` 记录清理历史

## 使用示例

```
用户: "我要开发一个新需求，涉及 yone-cmdb 和 cmdb-agent，功能是自动同步主机信息"

Claude:
1. 创建工作区: REQ-20260326-auto-sync-hosts
2. 拉取 yone-cmdb (master) 和 cmdb-agent (main) 最新代码
3. 开始阅读代码...
   - 发现 yone-cmdb 的主机模型在 models/host.go
   - cmdb-agent 的上报逻辑在 agent/reporter.go
4. 需求对齐对话...
5. 生成实现方案文档
6. 开始开发...
7. 测试通过
8. 提交代码到 feature/auto-sync-hosts 分支
```

## 配置命令

- `/multi-repo-dev init` - 初始化配置文件
- `/multi-repo-dev start` - 开始新需求
- `/multi-repo-dev resume {req-id}` - 恢复已有需求
- `/multi-repo-dev config` - 查看/编辑配置
- `/multi-repo-dev clean` - 清理已完成的需求工作区

## 注意事项

1. **代码安全**: 提交前检查无敏感信息泄露
2. **分支管理**: 始终从最新 main/master 创建分支
3. **测试覆盖**: 确保关键逻辑有测试
4. **文档更新**: 及时更新需求和实现文档
5. **Git 规范**: 遵循项目的 commit 规范

## 技术实现

- 使用 `Bash` 执行 git 操作
- 使用 `Agent` + `Explore` 深度代码分析
- 使用 `TaskCreate/TaskUpdate` 管理开发进度
- 使用 `Read/Write/Edit` 操作文件
- 使用 `AskUserQuestion` 进行需求对齐

## 依赖

- Git 已配置 SSH 密钥
- 对目标仓库有读写权限
- 工作区目录有写权限

---

## 🎨 Author Card

```bash
# 在 skill 完成时显示作者信息
.author-card/show-card.sh
```
