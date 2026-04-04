# 快速安装指南（AI Assistant 专用）

> 本指南供 AI Assistant（如 Claude Code）阅读，用于帮助用户快速安装 multi-repo-dev skill。

## 安装命令

当用户说"帮我安装 multi-repo-dev"或"安装这个 skill"时，执行以下步骤：

### 步骤 1: 一键安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

### 步骤 2: 或者 Git 克隆安装

```bash
# 创建目录（如果不存在）
mkdir -p ~/.claude/skills

# 克隆仓库
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git

# 运行配置向导
cd multi-repo-dev
bash quickstart.sh
```

## 验证安装

安装完成后，让用户在 Claude Code 中输入：

```
/multi-repo-dev config
```

如果显示配置信息，说明安装成功。

## 常见问题处理

### 问题 1: skills 目录不存在
```bash
mkdir -p ~/.claude/skills
```

### 问题 2: Git 未安装
使用 curl 方式安装（install.sh 会自动处理）

### 问题 3: 权限错误
```bash
chmod -R u+rwx ~/.claude/skills/multi-repo-dev
```

## AI Assistant 操作流程

1. **询问用户偏好**
   - 推荐使用一键安装脚本（最简单）
   - 如果用户想要更多控制，使用 Git 克隆方式

2. **执行安装**
   - 使用 Bash tool 运行安装命令
   - 显示安装进度给用户

3. **配置引导**
   - 告诉用户安装脚本会运行配置向导
   - 或者手动编辑 `~/.claude/skills/multi-repo-dev/config.json`

4. **验证安装**
   - 检查文件是否存在
   - 引导用户测试 `/multi-repo-dev` 命令

## 完整示例对话

```
User: 帮我安装 multi-repo-dev

AI: 好的！我来帮你安装 multi-repo-dev skill。推荐使用一键安装脚本，会自动完成所有配置。

执行安装命令：
[运行 Bash tool: curl -fsSL ... | bash]

安装完成！接下来：
1. 安装脚本会询问你一些配置问题，按提示操作即可
2. 配置完成后，在 Claude Code 中输入 `/multi-repo-dev start` 开始使用
3. 或者直接说"我要开发一个新需求"

需要我帮你配置项目信息吗？
```

## 仓库地址

- GitHub: https://github.com/Yonsun-w/multi-repo-dev
- 文档: https://github.com/Yonsun-w/multi-repo-dev#readme
- Issues: https://github.com/Yonsun-w/multi-repo-dev/issues
