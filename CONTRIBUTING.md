# Contributing to Multi-Repo-Dev

感谢你考虑为 Multi-Repo-Dev 做出贡献！

## 如何贡献

### 报告问题

如果你发现了 bug 或有功能建议：

1. 检查 [Issues](https://github.com/yonsun/multi-repo-dev/issues) 页面，确保问题还未被报告
2. 创建一个新的 Issue，清楚地描述：
   - 问题的复现步骤（如果是 bug）
   - 期望的行为
   - 实际的行为
   - 你的环境信息（Claude Code 版本、操作系统等）

### 提交代码

1. Fork 这个仓库
2. 创建你的功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交你的改动 (`git commit -m 'feat: add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建一个 Pull Request

### Commit 规范

请使用 [Conventional Commits](https://www.conventionalcommits.org/) 格式：

- `feat:` 新功能
- `fix:` Bug 修复
- `docs:` 文档更新
- `refactor:` 代码重构
- `test:` 测试相关
- `chore:` 构建/工具链相关

示例：
```
feat: add support for GitHub repositories
fix: resolve workspace path issue on Windows
docs: update installation guide
```

### 代码风格

- 保持代码简洁、易读
- 为复杂逻辑添加注释
- 更新相关文档

### 测试

在提交 PR 之前，请确保：

- 代码可以正常运行
- 没有破坏现有功能
- 添加了必要的文档说明

## 开发环境设置

```bash
# 克隆仓库
git clone https://github.com/yonsun/multi-repo-dev.git
cd multi-repo-dev

# 安装到 Claude Code
mkdir -p ~/.claude/skills/
ln -s $(pwd) ~/.claude/skills/multi-repo-dev

# 配置
cp config.example.json config.json
# 编辑 config.json 填入你的项目信息
```

## 需要帮助？

- 查看 [README.md](README.md) 了解项目基础
- 查看 [SETUP_GUIDE.md](SETUP_GUIDE.md) 了解配置细节
- 在 Issues 中提问

## 行为准则

- 尊重他人
- 接受建设性批评
- 关注对社区最有利的事情
- 对其他社区成员表示同理心

感谢你的贡献！ 🎉
