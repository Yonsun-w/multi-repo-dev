# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-04-04

### Added

#### 核心功能
- 🚀 完整的多仓库开发工作流支持
- 📋 需求初始化和工作区管理
- 🤖 AI 驱动的代码理解和分析
- 📝 自动生成需求文档和实现方案
- 🔄 Git 分支管理和代码提交
- 🧹 工作区清理功能

#### 安装方式
- ✅ 一键安装脚本 (install.sh)
- ✅ Git 克隆安装
- ✅ 快速配置向导 (quickstart.sh)
- ✅ AI 友好的安装指南

#### 文档
- 📖 完整的 README.md
- 📄 详细的 SETUP_GUIDE.md
- 🔧 INSTALL.md 安装指南
- 🤖 AI_INSTALL.md (专为 AI Assistant)
- 📝 QUICK_INSTALL.md
- 🤝 CONTRIBUTING.md 贡献指南

#### 配置
- ⚙️ config.example.json 配置示例
- 📋 REQUIREMENT_TEMPLATE.md 需求模板
- 📄 IMPLEMENTATION_TEMPLATE.md 实现方案模板
- 🔖 .meta.template.json 元数据模板

#### 工作流模块
- 📁 workflows/init-requirement.md - 需求初始化
- 🧹 workflows/cleanup-workspace.md - 工作区清理

#### 其他
- 📜 MIT License
- 🏷️ package.json (准备 npm 发布)
- 🚫 .gitignore (保护敏感配置)

### Features

- **多项目支持**: 同时管理多个相关仓库的开发任务
- **智能代码分析**: 使用 Claude Code 深度理解项目结构和依赖
- **需求对齐**: 交互式需求确认和方案讨论
- **自动化工作流**: 从需求到提交的全流程自动化
- **灵活配置**: 支持自定义分支前缀、提交规范等
- **工作区隔离**: 每个需求独立工作区，互不干扰

### Technical Details

- **目标平台**: Claude Code, Cursor
- **技术栈**: Bash, JSON, Markdown
- **Git 支持**: SSH 和 HTTPS 协议
- **跨平台**: macOS, Linux, Windows (WSL/Git Bash)

### Installation

```bash
# 一键安装
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash

# Git 克隆
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git
cd multi-repo-dev
bash quickstart.sh
```

### Usage

```bash
# 开始新需求
/multi-repo-dev start

# 恢复已有需求
/multi-repo-dev resume REQ-xxx

# 查看配置
/multi-repo-dev config

# 清理工作区
/multi-repo-dev clean
```

### Links

- GitHub: https://github.com/Yonsun-w/multi-repo-dev
- Issues: https://github.com/Yonsun-w/multi-repo-dev/issues
- License: MIT

---

## [Unreleased]

### Planned Features
- 🔜 NPM 包发布支持
- 🔜 更多工作流模块
- 🔜 CI/CD 集成示例
- 🔜 自定义 Hook 支持增强
- 🔜 多语言文档支持

---

**Note**: This is the first public release of multi-repo-dev. We welcome feedback and contributions!
