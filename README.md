# Multi-Repo Development Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![npm version](https://img.shields.io/npm/v/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![npm downloads](https://img.shields.io/npm/dm/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![GitHub release](https://img.shields.io/github/v/release/Yonsun-w/multi-repo-dev)](https://github.com/Yonsun-w/multi-repo-dev/releases)
[![GitHub stars](https://img.shields.io/github/stars/Yonsun-w/multi-repo-dev)](https://github.com/Yonsun-w/multi-repo-dev/stargazers)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue.svg)](https://claude.ai/code)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Yonsun-w/multi-repo-dev/pulls)

**多仓库 Git 管理利器** - 独立工作区 + 自动化 Git 操作，比 worktree 更简单粗暴。

## 🔥 为什么需要它？

### 传统方式的痛点

```bash
# 正在开发功能 A...
$ git status
# 一堆修改中的文件

# 突然来了紧急 Bug B！
$ git stash              # 😓 保存现场
$ git checkout -b fix-b  # 😓 切分支
# 修 Bug B...
$ git commit && git push
$ git checkout feature-a # 😓 切回来
$ git stash pop          # 😓 恢复现场
# 💥 可能还有冲突...
```

**问题**:
- ❌ 频繁 stash/pop，容易出错
- ❌ 分支切换打断思路
- ❌ 代码冲突风险
- ❌ 无法真正并行开发

### 使用 multi-repo-dev

```bash
# Terminal 1: 开发功能 A
$ cd workspace/feature-a/yone-cmdb
$ # 继续开发，啥都不用动！

# Terminal 2: 新开 CLI，处理 Bug B
$ claude-code
> "修复用户登录超时 Bug"

# ✅ 自动创建 workspace/fix-login/
# ✅ 自动克隆代码
# ✅ 自动创建分支
# 修完直接提交推送，完成！

# 功能 A 和 Bug B 完全隔离，零干扰！
```

**优势**:
- ✅ **零切换成本** - 不需要 stash、不需要切分支
- ✅ **完全隔离** - 各自独立目录，代码互不影响
- ✅ **真正并行** - 同时开发 10 个、100 个需求
- ✅ **10 倍速度** - 这才是真正的 10x 工程师秘诀

## ✨ 特性

### 核心能力：多仓库 Git 管理

- 🚀 **并行开发，零成本切换** - 新开 CLI，秒级创建新工作区，多任务真正并行（🔥 杀手级）
- 🗂️ **独立工作区隔离** - 功能 A、Bug B 各自独立目录，代码互不干扰
- 🔄 **自动 Git 克隆** - 一键拉取多个相关项目到工作区，无需手动管理
- 🌿 **统一分支管理** - 自动为所有项目创建同名分支，保持一致性
- 📦 **比 worktree 更简单** - 直接克隆新目录，不依赖现有仓库，更灵活
- 🧹 **工作区清理** - 需求完成后批量清理所有项目代码，释放空间

### 其他功能

- 📝 **元数据追踪** - 记录工作区状态、涉及项目、分支信息
- 🔧 **高度可配置** - 支持自定义项目列表、分支前缀、提交规范
- 📋 **文档模板** - 可选的需求文档模板（不强制）

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

## ⚙️ 配置

编辑 `~/.claude/skills/multi-repo-dev/config.json`:

```json
{
  "projects": {
    "my-project": {
      "repo": "git@github.com:user/repo.git",
      "branch": "main"
    }
  },
  "workspace": "~/workspace"
}
```

**就这么简单！** 其他都是可选配置。

## 💡 最佳实践：并行开发，零成本切换

### 🔥 杀手级用法：多任务真正并行

**场景**: 正在开发功能 A，突然来了紧急 Bug B

```bash
# Terminal 1: 继续开发功能 A（啥都不用动）
$ cd workspace/feature-a/yone-cmdb
$ vim service/user.go  # 继续写代码...

# Terminal 2: 新开 Claude Code CLI 处理 Bug
$ claude-code
> "修复用户登录超时 Bug，涉及 yone-cmdb 和 auth-service"

# Claude 自动：
# ✅ 创建 workspace/fix-login-timeout/
# ✅ 克隆 yone-cmdb 和 auth-service
# ✅ 创建分支 fix/login-timeout

$ cd workspace/fix-login-timeout/yone-cmdb
$ vim auth/session.go  # 修 Bug
$ git commit && git push  # 提交推送，完成！

# 功能 A 和 Bug B 完全隔离，零干扰！
```

**对比传统方式**:

| 操作 | 传统方式 | multi-repo-dev |
|------|---------|----------------|
| 保存现场 | `git stash` 😓 | 不需要 ✅ |
| 切换分支 | `git checkout` 😓 | 不需要 ✅ |
| 代码冲突 | 可能冲突 💥 | 完全隔离 ✅ |
| 恢复现场 | `git stash pop` 😓 | 不需要 ✅ |
| 并行能力 | 无法并行 ❌ | 真正并行 ✅ |

**真实收益**:
- ✅ **零切换成本** - 不 stash、不切分支、不恢复
- ✅ **零心智负担** - 每个任务独立环境，清晰明确
- ✅ **零代码冲突** - 物理隔离，不可能冲突
- ✅ **10x-100x 提速** - 同时开 10 个 CLI，处理 10 个任务

### 其他使用场景

#### 场景 1: 单仓库开发

```bash
$ claude-code
> "给 yone-cmdb 添加导出功能"
# ✅ 自动创建工作区、克隆代码、创建分支
```

#### 场景 2: 多仓库联动开发

```bash
$ claude-code
> "实现主机信息同步，涉及 yone-cmdb、cmdb-agent、cmdb-sync"
# ✅ 自动克隆 3 个项目，创建统一分支
# ✅ 不用手动管理多个仓库
```

#### 场景 3: 清理工作区

```bash
$ claude-code
> "清理已完成的工作区"
# ✅ 扫描并清理已合并的工作区
# ✅ 释放磁盘空间
```

## 💡 使用技巧

### 最大化并行能力

```bash
# 同时开启多个 CLI 窗口
Terminal 1: 开发功能 A
Terminal 2: 修复 Bug B
Terminal 3: 重构模块 C
Terminal 4: 优化性能 D
# ... 10 个、100 个任务并行！
```

### 快速命令

| 命令 | 说明 |
|------|------|
| `/multi-repo-dev start` | 开始新需求 |
| `/multi-repo-dev clean` | 清理工作区 |
| `/multi-repo-dev list` | 列出所有工作区 |

### 配置建议

- ✅ 将 `config.json` 加入 `.gitignore`
- ✅ 定期清理已完成的工作区
- ✅ 使用有意义的分支命名

## 📚 文档

- [CONTRIBUTING.md](CONTRIBUTING.md) - 贡献指南
- [CHANGELOG.md](CHANGELOG.md) - 版本历史

## 🐛 问题反馈

- [GitHub Issues](https://github.com/Yonsun-w/multi-repo-dev/issues)
- [GitHub Discussions](https://github.com/Yonsun-w/multi-repo-dev/discussions)

---

## 📄 License

MIT © [yonsun](https://github.com/Yonsun-w)

**如果觉得有用，请给个 ⭐️ Star！**
