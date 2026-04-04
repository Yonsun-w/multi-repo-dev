# 创建 GitHub Release 指南

Tag v1.0.0 已经推送到 GitHub，现在需要手动创建 Release。

## 步骤

### 1. 访问 Release 页面
打开: https://github.com/Yonsun-w/multi-repo-dev/releases/new?tag=v1.0.0

### 2. 填写 Release 信息

**Tag**: `v1.0.0` (已自动选择)

**Release title**:
```
v1.0.0 - 首次公开发布 🎉
```

**Description**: 复制粘贴以下内容

---

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

在 Claude Code 中：
```
/multi-repo-dev start
```
或直接说："我要开发一个新需求"

## 📚 完整文档

查看 [README.md](https://github.com/Yonsun-w/multi-repo-dev#readme) 了解详细信息。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

感谢使用 Multi-Repo-Dev！如果觉得有用，请给个 ⭐️ Star！

---

### 3. 发布选项

- ✅ 勾选 "Set as the latest release"
- ✅ 勾选 "Create a discussion for this release" (可选)

### 4. 点击 "Publish release"

完成！🎉
