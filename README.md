# Multi-Repo Development Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![npm version](https://img.shields.io/npm/v/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![npm downloads](https://img.shields.io/npm/dm/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![GitHub release](https://img.shields.io/github/v/release/Yonsun-w/multi-repo-dev)](https://github.com/Yonsun-w/multi-repo-dev/releases)
[![GitHub stars](https://img.shields.io/github/stars/Yonsun-w/multi-repo-dev)](https://github.com/Yonsun-w/multi-repo-dev/stargazers)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue.svg)](https://claude.ai/code)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Yonsun-w/multi-repo-dev/pulls)

**多仓库 Git 管理利器** - 为跨项目需求开发提供独立工作区和自动化 Git 操作，比 worktree 更简单粗暴。

> 💡 **核心价值**: 一个需求涉及多个仓库？自动克隆、统一分支、独立工作区 - 让你专注代码，无需手动管理 Git。

> 🔥 **杀手级功能**: 正在开发功能 A，突然来了 Bug B？**新开 CLI，直接说需求，自动拉新工作区** - A 和 B 完全隔离，互不干扰。真正实现 **10 倍、100 倍并行开发速度**！

> 🤖 **给 AI Assistant 的安装指南**: 如果你是 AI（Claude/ChatGPT/Cursor），查看 **[AI_INSTALL.md](AI_INSTALL.md)** 获取一键安装命令，直接帮用户安装此 skill。

## ✨ 特性

### 核心能力：多仓库 Git 管理

- 🚀 **并行开发，零成本切换** - 新开 CLI，秒级创建新工作区，多任务真正并行（🔥 杀手级）
- 🗂️ **独立工作区隔离** - 功能 A、Bug B 各自独立目录，代码互不干扰
- 🔄 **自动 Git 克隆** - 一键拉取多个相关项目到工作区，无需手动管理
- 🌿 **统一分支管理** - 自动为所有项目创建同名分支，保持一致性
- 📦 **比 worktree 更简单** - 直接克隆新目录，不依赖现有仓库，更灵活
- 🧹 **工作区清理** - 需求完成后批量清理所有项目代码，释放空间

### 辅助功能

- 📋 **需求文档模板** - 标准化的需求描述和实现方案
- 📝 **元数据追踪** - 记录需求状态、涉及项目、分支信息
- 🔧 **高度可配置** - 支持自定义项目列表、分支前缀、提交规范

## 📦 安装

> 💡 **AI Assistant 安装指南**: 如果你是 AI，查看 [QUICK_INSTALL.md](QUICK_INSTALL.md) 获取安装步骤。

### 方法 1: 一键安装（推荐）

使用安装脚本自动完成安装和配置：

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

或者先下载再安装：

```bash
# 下载安装脚本
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh -o install.sh

# 查看脚本内容（可选）
cat install.sh

# 执行安装
bash install.sh
```

### 方法 2: Git 克隆安装

```bash
# 克隆仓库到 Claude Code skills 目录
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git

# 运行快速配置向导
cd multi-repo-dev
bash quickstart.sh
```

### 方法 3: NPM 安装

```bash
# 全局安装
npm install -g @yonsun-w/multi-repo-dev

# 运行安装脚本
multi-repo-dev-install
```

或者使用 npx 一次性安装：

```bash
npx @yonsun-w/multi-repo-dev multi-repo-dev-install
```

## 快速开始

### 1. 初始化配置

```bash
# 进入 skill 目录
cd ~/.claude/skills/multi-repo-dev

# 复制示例配置
cp config.example.json config.json

# 编辑 config.json，填入你的项目信息
# 主要修改:
# - projects: 添加你的项目信息
# - workspace: 设置工作区路径
```

### 2. 开始使用

```bash
# 调用 skill
/multi-repo-dev start
```

或者直接告诉 Claude:

```
"我要开发一个新需求,涉及 yone-cmdb 和 cmdb-agent 项目"
```

## 🔄 Git 管理流程

```
[创建工作区] → [克隆仓库] → [创建分支] → [开发代码] → [统一提交] → [清理工作区]
     ↓              ↓             ↓             ↓             ↓              ↓
  独立目录      自动 clone    同名 branch    你的工作    统一 commit    释放空间
  需求隔离      多个项目      保持一致      专注开发    推送分支       可选清理
```

**核心特点**:
- ✅ 自动化 Git 操作，减少重复劳动
- ✅ 工作区隔离，多需求并行开发互不干扰
- ✅ 直接克隆新目录，比 worktree 更简单
- ✅ 统一管理多个仓库的分支和提交

## 目录结构

```
multi-repo-dev/
├── README.md                    # 本文件
├── skill.md                     # Skill 主入口
├── config.example.json          # 配置示例
├── config.json                  # 你的配置 (需创建)
├── REQUIREMENT_TEMPLATE.md      # 需求文档模板
├── IMPLEMENTATION_TEMPLATE.md   # 实现方案模板
├── .meta.template.json          # 元数据模板
└── workflows/                   # 工作流子模块
    ├── init-requirement.md      # 阶段1: 初始化
    ├── align-requirement.md     # 阶段2: 对齐需求
    ├── implement.md             # 阶段3: 开发实现
    ├── finalize.md              # 阶段4: 提交推送
    └── cleanup-workspace.md     # 阶段5: 工作区清理
```

## 配置说明

### config.json 结构

```json
{
  "projects": {
    "项目名称": {
      "repo": "git仓库地址",
      "branch": "默认分支",
      "localPath": "本地路径(可选)",
      "tech": ["技术栈"],
      "description": "项目描述"
    }
  },
  "workspace": "需求工作区根目录",
  "settings": {
    "autoCreateBranch": true,           // 自动创建分支
    "branchPrefix": "feature/",         // 分支前缀
    "commitPrefix": "feat",             // commit 前缀
    "autoTest": true,
    "requireApproval": {
      "beforeImplement": true,
      "beforePush": true
    }
  },
  "cleanup": {
    "autoPrompt": true,                 // 完成后自动询问清理
    "defaultMode": "repos-only",        // 默认清理模式
    "keepDays": 7,                      // 保留最近N天
    "minDiskSpace": "1GB"               // 磁盘不足时提示
    "autoTest": true,                   // 自动运行测试
    "requireApproval": {
      "beforeImplement": true,          // 实现前需确认
      "beforePush": true                // 推送前需确认
    }
  }
}
```

### 工作区结构

每个需求会创建独立工作区:

```
workspace/
└── REQ-20260326-feature-name/
    ├── REQUIREMENT.md          # 需求文档
    ├── IMPLEMENTATION.md       # 实现方案
    ├── .meta.json              # 元数据
    └── repos/                  # 项目代码
        ├── project-a/
        │   └── .git/
        └── project-b/
            └── .git/
```

## 使用场景

### 场景 1: 单仓库快速修复

```
你: "给 yone-cmdb 添加导出功能"

Claude 自动处理：
1. ✅ 创建工作区: workspace/REQ-20260404-export/
2. ✅ 克隆代码: git clone <yone-cmdb>
3. ✅ 创建分支: feature/export
4. ✅ 生成需求文档

你开发 → 提交 → 推送 → 完成
```

### 场景 2: 多仓库需求开发（核心场景）

```
你: "实现主机信息自动同步，涉及 yone-cmdb、cmdb-agent 和 cmdb-sync"

Claude 自动处理 Git 管理：
1. ✅ 创建独立工作区: workspace/REQ-20260326-auto-sync-hosts/
2. ✅ 自动克隆 3 个项目:
   - git clone <yone-cmdb> → repos/yone-cmdb/
   - git clone <cmdb-agent> → repos/cmdb-agent/
   - git clone <cmdb-sync> → repos/cmdb-sync/
3. ✅ 为所有项目创建同名分支: feature/auto-sync-hosts
4. ✅ 生成需求文档模板

你专注开发，无需关心 Git 操作：
- 在各项目中开发代码
- 本地测试
- 联调验证

完成后一键提交：
5. ✅ 统一提交所有项目的改动
6. ✅ 推送到远程分支
7. ✅ 清理工作区（可选）
```

**核心价值**:
- 不用手动克隆多个仓库
- 不用担心目录混乱
- 不用记住每个项目的分支名
- 类似 worktree 但更直接粗暴 - 直接新目录新克隆

### 场景 3: 并行开发，互不干扰（🔥 杀手级功能）

**问题场景**:
```
你正在开发功能 A（workspace/REQ-0401-feature-a/）
突然来了紧急 Bug B 要修
传统做法: stash → 切分支 → 修 bug → 切回 → pop
结果: 工作被打断，容易出错
```

**使用 multi-repo-dev**:
```
Terminal 1: 继续开发功能 A
你: cd workspace/REQ-0401-feature-a/yone-cmdb
    # 继续写你的功能 A 代码...

Terminal 2: 新开一个 Claude Code CLI
你: "修复用户登录超时的 Bug，涉及 yone-cmdb 和 auth-service"

Claude 立即创建新工作区:
1. ✅ workspace/REQ-0404-fix-login-timeout/
2. ✅ 自动克隆 yone-cmdb 和 auth-service
3. ✅ 创建分支 fix/login-timeout

你: 在新工作区修 Bug → 测试 → 提交 → 推送
功能 A 完全不受影响，代码互不冲突！

完成后:
Terminal 1: 功能 A 继续开发
Terminal 2: Bug 已修复并推送，工作区可清理
```

**核心价值**:
- ✅ **零切换成本** - 不需要 stash、切分支
- ✅ **完全隔离** - 两个工作区互不干扰
- ✅ **并行开发** - 同时处理 10 个、100 个需求
- ✅ **十倍百倍提速** - 真正的多任务并行

### 场景 4: 恢复已有需求

```
你: "/multi-repo-dev resume REQ-20260320-feature-x"

Claude:
1. 读取工作区元数据
2. 检查各项目分支状态
3. 恢复上次进度
4. 继续未完成的工作
```

### 场景 4: 清理工作区

```
你: "开发完成了,帮我清理一下工作区"

Claude:
扫描工作区,发现 3 个已完成的需求:
1. REQ-20260401-frontend-update (120 MB)
2. REQ-20260330-stress-test-integration (156 MB)
3. REQ-20260401-network-inner-optimization (85 MB)

如何处理?
[完全删除] [仅删除代码] [不清理]

你: 选择 "仅删除代码"

Claude:
✅ 已清理 3 个工作区
📊 释放空间: 361 MB
📝 保留文档供日后参考
```

## 命令参考

| 命令 | 说明 |
|------|------|
| `/multi-repo-dev start` | 开始新需求 |
| `/multi-repo-dev resume <req-id>` | 恢复需求 |
| `/multi-repo-dev status` | 查看当前状态 |
| `/multi-repo-dev config` | 查看/编辑配置 |
| `/multi-repo-dev list` | 列出所有需求 |
| `/multi-repo-dev clean` | 清理已完成的需求工作区 |

## 最佳实践

1. **配置管理**
   - 将 `config.json` 加入 `.gitignore`
   - 团队可以共享 `config.example.json`

2. **分支命名**
   - 使用有意义的名称: `feature/user-auth` 而非 `feature/fix`
   - 保持与需求 ID 一致

3. **Commit 规范**
   - 遵循 Conventional Commits
   - 每个 commit 对应一个完整的功能点

4. **测试**
   - 开发过程中持续测试
   - 提交前确保所有测试通过

5. **文档更新**
   - 及时更新 REQUIREMENT.md 和 IMPLEMENTATION.md
   - 记录重要决策和变更

## 故障排查

### 问题: Git 认证失败

```bash
# 检查 SSH 密钥
ssh -T git@gitlab.com

# 或使用 HTTPS (需配置 token)
```

### 问题: 工作区路径冲突

```bash
# 使用清理命令
/multi-repo-dev clean

# 或手动清理
rm -rf workspace/REQ-xxx

# 或在配置中修改 workspace 路径
```

### 问题: 磁盘空间不足

使用清理功能释放空间:

```bash
# 列出并清理已完成的需求
/multi-repo-dev clean

# 手动检查磁盘占用
du -sh workspace/REQ-*/
```

### 问题: 代码拉取慢

```bash
# 使用本地路径而非每次克隆
"localPath": "/path/to/existing/repo"
```

## 扩展

### 添加自定义钩子

在 `config.json` 中添加:

```json
{
  "hooks": {
    "afterInit": "echo 'Workspace created'",
    "beforeCommit": "npm run lint",
    "afterPush": "notify-team.sh"
  }
}
```

### 集成 CI/CD

工作区可以作为 CI/CD 的输入:

```yaml
# .gitlab-ci.yml
test:
  script:
    - cd ${WORKSPACE}/repos/project-a
    - npm test
```

## 🤝 贡献

欢迎提交改进建议或新功能！查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解更多信息。

## 📄 许可

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 💬 支持

- 📖 [文档](https://github.com/yonsun/multi-repo-dev/wiki)
- 🐛 [报告问题](https://github.com/yonsun/multi-repo-dev/issues)
- 💡 [功能建议](https://github.com/yonsun/multi-repo-dev/issues/new)

## ⭐ Star History

如果这个项目对你有帮助，请给个 Star！
