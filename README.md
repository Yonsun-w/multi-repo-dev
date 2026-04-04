<div align="center">

# 🌲 Multi-Repo Development Workflow

**多仓库 Git 管理利器 - 独立工作区 + 自动化 Git 操作，比 worktree 更简单粗暴**

[![GitHub stars](https://img.shields.io/github/stars/Yonsun-w/multi-repo-dev?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/v/release/Yonsun-w/multi-repo-dev?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/releases)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/pulls)

[快速开始](#-快速开始) • [特性](#-特性) • [安装](#-安装) • [最佳实践](#-最佳实践并行开发零成本切换) • [文档](#-文档)

</div>

---

## 🔥 为什么需要它?

### ❌ 传统方式的痛点

<table>
<tr>
<td width="50%">

**传统 Git 工作流**

```bash
# 正在开发功能 A...
$ git status
# 一堆修改中的文件

# 😱 突然来了紧急 Bug B！
$ git stash              # 保存现场
$ git checkout -b fix-b  # 切分支
# 修 Bug B...
$ git commit && git push
$ git checkout feature-a # 切回来
$ git stash pop          # 恢复现场
# 💥 可能还有冲突...
```

**问题**:
- ❌ 频繁 stash/pop，容易出错
- ❌ 分支切换打断思路
- ❌ 代码冲突风险
- ❌ 无法真正并行开发

</td>
<td width="50%">

**使用 multi-repo-dev**

```bash
# Terminal 1: 开发功能 A
$ cd workspace/feature-a/project
$ # 继续开发，啥都不用动！✅

# Terminal 2: 新开 CLI，处理 Bug B
$ claude-code
> "修复用户登录超时 Bug"

# ✨ 自动创建 workspace/fix-login/
# ✨ 自动克隆代码
# ✨ 自动创建分支

$ # 修完直接提交推送，完成！

# 功能 A 和 Bug B 完全隔离，零干扰！
```

**优势**:
- ✅ 零切换成本
- ✅ 完全隔离
- ✅ 真正并行
- ✅ 10 倍速度

</td>
</tr>
</table>

---

## ✨ 特性

<table>
<tr>
<td width="50%">

### 🎯 核心能力

- **💬 AI 全自动配置**
  对话即可完成配置，零门槛

- **🚀 并行开发，零成本切换**
  新开 CLI，秒级创建新工作区

- **🗂️ 独立工作区隔离**
  各任务独立目录，互不干扰

- **🔄 自动 Git 克隆**
  一键拉取多个项目到工作区

</td>
<td width="50%">

### 🛠️ 其他功能

- **🌿 统一分支管理**
  自动创建同名分支，保持一致

- **📦 比 worktree 更简单**
  直接克隆新目录，更灵活

- **🧹 工作区清理**
  批量清理已完成工作，释放空间

- **📝 元数据追踪**
  记录工作区状态和分支信息

</td>
</tr>
</table>

---

## 📦 安装

> 💡 **AI Assistant**: 如果你是 AI，查看 [QUICK_INSTALL.md](QUICK_INSTALL.md) 获取安装步骤。

### 方法 1: 一键安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

### 方法 2: Git 克隆

```bash
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git
cd multi-repo-dev
bash quickstart.sh
```

### 方法 3: NPM 安装

```bash
npm install -g @yonsun-w/multi-repo-dev
multi-repo-dev-install
```

---

## 🚀 快速开始

### 💬 让 AI 帮你配置（推荐）

**安装后，直接对话即可：**

```
你: "帮我配置 multi-repo-dev"

Claude: 好的！请告诉我：
1. 你的项目仓库地址？
2. 工作区路径放哪里？

你: "仓库是 git@github.com:user/project.git，工作区放 ~/workspace"

Claude: ✅ 配置已创建！现在可以开始使用了。
```

**AI 会自动：**
- ✅ 创建 `config.json`
- ✅ 填写项目信息
- ✅ 验证配置格式

### 🎯 开始开发

直接告诉 Claude 你的需求：

```
"开发新功能 XX，涉及 project-a 和 project-b"
```

AI 自动完成：
1. ✅ 创建独立工作区
2. ✅ 克隆项目代码
3. ✅ 创建开发分支
4. ✅ 准备就绪！

---

## 💡 最佳实践：并行开发，零成本切换

### 🔥 杀手级用法：多任务真正并行

**场景**: 正在开发功能 A，突然来了紧急 Bug B

<table>
<tr>
<th width="50%">Terminal 1: 继续开发功能 A</th>
<th width="50%">Terminal 2: 处理 Bug B</th>
</tr>
<tr>
<td>

```bash
# 啥都不用动！
$ cd workspace/feature-a/yone-cmdb
$ vim service/user.go
# 继续写代码...
```

</td>
<td>

```bash
# 新开 CLI
$ claude-code
> "修复用户登录超时 Bug"

# Claude 自动：
# ✅ 创建 workspace/fix-login/
# ✅ 克隆代码
# ✅ 创建分支

$ cd workspace/fix-login/yone-cmdb
$ vim auth/session.go  # 修 Bug
$ git commit && git push  # 完成！
```

</td>
</tr>
</table>

### 📊 对比传统方式

| 操作 | 传统方式 | multi-repo-dev |
|------|---------|----------------|
| 保存现场 | `git stash` 😓 | **不需要** ✅ |
| 切换分支 | `git checkout` 😓 | **不需要** ✅ |
| 代码冲突 | 可能冲突 💥 | **完全隔离** ✅ |
| 恢复现场 | `git stash pop` 😓 | **不需要** ✅ |
| 并行能力 | 无法并行 ❌ | **真正并行** ✅ |

### ✨ 真实收益

- ✅ **零切换成本** - 不 stash、不切分支、不恢复
- ✅ **零心智负担** - 每个任务独立环境，清晰明确
- ✅ **零代码冲突** - 物理隔离，不可能冲突
- ✅ **10x-100x 提速** - 同时开 10 个 CLI，处理 10 个任务

---

## 🔄 工作流程

```
[创建工作区] → [克隆仓库] → [创建分支] → [开发代码] → [统一提交] → [清理工作区]
     ↓              ↓             ↓             ↓             ↓              ↓
  独立目录      自动 clone    同名 branch    你的工作    统一 commit    释放空间
  需求隔离      多个项目      保持一致      专注开发    推送分支       可选清理
```

---

## 💡 使用技巧

### 1️⃣ 最大化并行能力

```bash
# 同时开启多个 CLI 窗口
Terminal 1: 开发功能 A
Terminal 2: 修复 Bug B
Terminal 3: 重构模块 C
Terminal 4: 优化性能 D
# ... 10 个、100 个任务并行！
```

### 2️⃣ 常用命令

#### 列出工作区

```bash
$ /multi-repo-dev list
```

**输出示例**：
```
📊 工作区列表

工作区                                              大小      仓库数
-------------------------------------------------- ---------- --------
REQ-20260404-user-auth/                            156M        2
REQ-20260403-bug-fix/                              89M         1
REQ-20260402-feature-export/                       234M        3

总计: 3 个工作区，479 MB

💡 提示: 使用 /multi-repo-dev clean 清理已完成的工作区
```

#### 清理工作区

```bash
$ /multi-repo-dev clean
```

**输出示例**：
```
🧹 扫描已完成的工作区...

发现 2 个可清理的工作区:
1. REQ-20260401-completed-task (156 MB)
2. REQ-20260330-old-feature (234 MB)

清理选项:
  [完全删除] - 删除整个工作区（包括文档）
  [仅删除代码] - 保留文档，删除 repos/ 目录
  [跳过] - 不清理

✅ 已清理 2 个工作区
📊 释放空间: 390 MB
```

---

## ⚙️ 配置

### 方式 1: AI 交互配置（推荐）

```
你: "配置 multi-repo-dev，添加我的项目"
你: "仓库地址: git@github.com:user/project.git"
你: "默认分支: main"
你: "工作区路径: ~/workspace"

Claude: ✅ 已配置完成！
```

### 方式 2: 手动编辑

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

---

## 📁 目录结构

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

---

## 🎯 使用场景

### 场景 1: 单仓库开发

```bash
$ claude-code
> "给 yone-cmdb 添加导出功能"
# ✅ 自动创建工作区、克隆代码、创建分支
```

### 场景 2: 多仓库联动开发

```bash
$ claude-code
> "实现主机信息同步，涉及 yone-cmdb、cmdb-agent、cmdb-sync"
# ✅ 自动克隆 3 个项目，创建统一分支
```

### 场景 3: 紧急 Bug 修复

```bash
# 功能 A 正在开发中，不需要中断
# 新开 CLI 处理 Bug B
$ claude-code
> "修复登录超时问题"
# ✅ 完全独立的工作区，互不影响
```

---

## 📚 文档

- [QUICK_INSTALL.md](QUICK_INSTALL.md) - AI Assistant 安装指南
- [CONTRIBUTING.md](CONTRIBUTING.md) - 贡献指南
- [CHANGELOG.md](CHANGELOG.md) - 版本历史

---

## 🤝 贡献

欢迎贡献！请查看 [贡献指南](CONTRIBUTING.md)。

---

## 🐛 问题反馈

<div align="center">

[![GitHub Issues](https://img.shields.io/badge/Issues-反馈问题-green?style=for-the-badge&logo=github)](https://github.com/Yonsun-w/multi-repo-dev/issues)
[![GitHub Discussions](https://img.shields.io/badge/Discussions-功能建议-blue?style=for-the-badge&logo=github)](https://github.com/Yonsun-w/multi-repo-dev/discussions)

</div>

---

## 📄 License

MIT © [yonsun](https://github.com/Yonsun-w)

---

<div align="center">

### 💡 让复杂的多仓库管理变简单

**如果觉得有用，请给个 ⭐️ Star 支持一下！**

[![Star History Chart](https://api.star-history.com/svg?repos=Yonsun-w/multi-repo-dev&type=Date)](https://star-history.com/#Yonsun-w/multi-repo-dev&Date)

</div>
