# AI 一键安装指令

> 当用户要求安装 multi-repo-dev 时，AI 可以直接使用以下命令。

## 安装命令

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

## AI 操作步骤

### 1. 确认用户意图
```
用户: 帮我安装 multi-repo-dev
或: 安装这个 skill
或: 我想用 multi-repo-dev
```

### 2. 执行安装
使用 `Bash` tool 运行：
```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

### 3. 告知用户
```
✅ 安装脚本正在运行...

安装脚本会：
- 自动下载最新版本到 ~/.claude/skills/multi-repo-dev
- 运行配置向导，询问你：
  1. 工作区路径（默认: ~/Project/requirements）
  2. 是否添加当前项目到配置

请按照提示完成配置。
```

### 4. 验证安装（可选）
```bash
ls ~/.claude/skills/multi-repo-dev/
cat ~/.claude/skills/multi-repo-dev/config.json
```

### 5. 引导使用
```
安装完成！你可以：
- 输入 `/multi-repo-dev start` 开始新需求
- 或直接说："我要开发一个新需求"
```

## 备选方案：Git 克隆

如果一键安装失败，使用 Git 克隆：

```bash
mkdir -p ~/.claude/skills && \
cd ~/.claude/skills && \
git clone https://github.com/Yonsun-w/multi-repo-dev.git && \
cd multi-repo-dev && \
bash quickstart.sh
```

## 最简化版本（复制粘贴）

```bash
# 一键安装
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash

# Git 安装
cd ~/.claude/skills && git clone https://github.com/Yonsun-w/multi-repo-dev.git && cd multi-repo-dev && bash quickstart.sh
```
