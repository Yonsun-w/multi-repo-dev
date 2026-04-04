# Multi-Repo Development Workflow

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue.svg)](https://claude.ai/code)

完整的多仓库需求开发工作流 skill，适用于 Claude Code。

> 🤖 **给 AI Assistant 的安装指南**: 如果你是 AI（Claude/ChatGPT/Cursor），查看 **[AI_INSTALL.md](AI_INSTALL.md)** 获取一键安装命令，直接帮用户安装此 skill。

## ✨ 特性

- 🚀 **多仓库支持** - 一次性管理多个相关项目的开发
- 📋 **完整工作流** - 从需求对齐到代码提交的全流程自动化
- 🤖 **智能代码理解** - AI 深度分析项目结构和依赖关系
- 📝 **文档自动生成** - 自动生成需求文档和实现方案
- 🧹 **工作区管理** - 灵活的工作区创建和清理机制
- 🔧 **高度可配置** - 支持自定义项目、分支、提交规范等

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

### 方法 3: NPM 安装（即将支持）

```bash
# 全局安装
npm install -g @yonsun-w/multi-repo-dev

# 或本地安装到 skills 目录
cd ~/.claude/skills
npx @yonsun-w/multi-repo-dev
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

## 工作流程

```
[需求初始化] → [代码理解] → [需求对齐] → [开发实现] → [提交推送]
     ↓              ↓             ↓             ↓             ↓
  创建工区      读代码分析      生成方案     按文档开发     压缩提交
  拉取代码      识别模式        确认细节     本地测试       推送分支
  初始文档      评估影响                     更新文档       创建 MR
```

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

### 场景 1: 单仓库简单需求

```
你: "我要给 yone-cmdb 添加一个导出功能"

Claude:
1. 创建工作区 REQ-20260326-export-feature
2. 拉取 yone-cmdb 代码
3. 阅读相关代码(导出、文件处理等)
4. 对齐需求细节
5. 生成实现方案
6. 开发 → 测试 → 提交
```

### 场景 2: 多仓库复杂需求

```
你: "实现主机信息自动同步,涉及 yone-cmdb、cmdb-agent 和 cmdb-sync"

Claude:
1. 创建工作区 REQ-20260326-auto-sync-hosts
2. 拉取 3 个项目代码
3. 深度阅读代码,分析:
   - yone-cmdb 的数据模型
   - cmdb-agent 的上报机制
   - cmdb-sync 的同步逻辑
4. 识别改动点和依赖关系
5. 与你对齐:
   - 同步频率?
   - 冲突处理?
   - 失败重试?
6. 生成详细方案(分项目、分模块)
7. 按方案逐步实现
8. 联调测试
9. 提交所有项目的改动
```

### 场景 3: 恢复已有需求

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
