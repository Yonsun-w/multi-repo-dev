# Release Notes - v1.0.0

🎉 **首次公开发布！**

Multi-Repo-Dev 是一个专为 Claude Code 设计的多仓库开发工作流 skill，帮助开发者高效管理跨项目需求开发。

## 🌟 主要特性

### 多仓库协同开发
- 一次性管理多个相关项目的开发任务
- 自动克隆和更新代码仓库
- 独立工作区，项目间互不干扰

### AI 驱动的智能工作流
- 🤖 深度代码理解和架构分析
- 📋 交互式需求对齐和方案讨论
- 📝 自动生成需求文档和实现方案
- ✅ 智能任务拆解和进度跟踪

### 完整的开发生命周期
```
需求初始化 → 代码理解 → 需求对齐 → 开发实现 → 提交推送 → 工作区清理
```

### 灵活的配置系统
- 支持多项目配置
- 自定义分支策略
- 灵活的提交规范
- 可选的本地路径映射

## 📦 安装

### 一键安装（推荐）
```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

### Git 克隆安装
```bash
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git
cd multi-repo-dev
bash quickstart.sh
```

## 🚀 快速开始

1. **安装 skill**
   ```bash
   curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
   ```

2. **配置项目**
   编辑 `~/.claude/skills/multi-repo-dev/config.json`：
   ```json
   {
     "projects": {
       "my-project": {
         "repo": "git@github.com:username/project.git",
         "branch": "main"
       }
     },
     "workspace": "~/Project/requirements"
   }
   ```

3. **开始使用**
   在 Claude Code 中：
   ```
   /multi-repo-dev start
   ```
   或直接说："我要开发一个新需求"

## 📚 文档

- [README.md](README.md) - 项目介绍和功能说明
- [INSTALL.md](INSTALL.md) - 详细安装指南
- [SETUP_GUIDE.md](SETUP_GUIDE.md) - 配置指南
- [AI_INSTALL.md](AI_INSTALL.md) - AI Assistant 安装指南
- [CONTRIBUTING.md](CONTRIBUTING.md) - 贡献指南
- [CHANGELOG.md](CHANGELOG.md) - 更新日志

## 🎯 使用场景

### 场景 1: 单仓库功能开发
```
你: "给 my-app 添加用户导出功能"
→ 自动分析现有代码
→ 生成实现方案
→ 引导开发实现
→ 提交代码
```

### 场景 2: 多仓库联动开发
```
你: "实现前后端数据同步，涉及 backend 和 frontend 项目"
→ 同时拉取两个项目
→ 分析项目间依赖
→ 设计跨项目方案
→ 分别实现和测试
→ 统一提交
```

### 场景 3: 恢复和继续
```
你: "/multi-repo-dev resume REQ-20260401-sync-data"
→ 恢复工作区状态
→ 继续未完成的任务
```

## 🔧 系统要求

- Claude Code (最新版本)
- Git (用于代码管理)
- Bash shell (macOS/Linux 自带)
- 对目标仓库的读写权限

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解如何参与贡献。

## 📄 许可证

MIT License - 查看 [LICENSE](LICENSE) 了解详情

## 🔗 链接

- **GitHub**: https://github.com/Yonsun-w/multi-repo-dev
- **Issues**: https://github.com/Yonsun-w/multi-repo-dev/issues
- **Discussions**: https://github.com/Yonsun-w/multi-repo-dev/discussions

## 💬 反馈

如果你觉得这个项目有用，请给个 ⭐️ Star！

有问题或建议？欢迎：
- 提交 [Issue](https://github.com/Yonsun-w/multi-repo-dev/issues/new)
- 参与 [讨论](https://github.com/Yonsun-w/multi-repo-dev/discussions)
- 提交 Pull Request

---

感谢使用 Multi-Repo-Dev！🎉
