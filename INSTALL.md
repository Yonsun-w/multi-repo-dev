# 安装指南

Multi-Repo-Dev 提供多种安装方式，选择最适合你的方式。

## 📋 前置要求

- Claude Code 已安装
- Git（推荐，用于克隆和管理代码）
- Bash shell（macOS/Linux 自带，Windows 需要 Git Bash 或 WSL）

## 🚀 安装方式

### 方法 1: 一键安装脚本（推荐）

最简单快速的安装方式，自动完成下载、安装和配置：

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

**安装脚本会：**
- ✅ 自动检测 Claude Code skills 目录
- ✅ 下载最新版本
- ✅ 备份现有配置（如果存在）
- ✅ 运行配置向导
- ✅ 验证安装完整性

### 方法 2: Git 克隆（适合开发者）

```bash
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git
cd multi-repo-dev
bash quickstart.sh
```

## ✅ 验证安装

在 Claude Code 中测试：

```
你: /multi-repo-dev config
Claude: 应该显示你的配置信息
```

完整安装指南和故障排查请查看完整版文档。
