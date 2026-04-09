<div align="center">

# 🌲 Multi-Repo Development Workflow

**Multi-Repository Git Management Tool - Independent Workspaces + Automated Git Operations, Simpler Than Worktree**

[![GitHub stars](https://img.shields.io/github/stars/Yonsun-w/multi-repo-dev?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/v/release/Yonsun-w/multi-repo-dev?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/releases)
[![npm version](https://img.shields.io/npm/v/@yonsun-w/multi-repo-dev?style=for-the-badge)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](https://github.com/Yonsun-w/multi-repo-dev/pulls)

English | [简体中文](README.md)

[Quick Start](#-quick-start) • [Features](#-features) • [Installation](#-installation) • [Best Practices](#-best-practices-parallel-development-zero-cost-switching) • [Documentation](#-documentation)

</div>

---

## 🔥 Why Do You Need It?

### ❌ Pain Points of Traditional Approaches

<table>
<tr>
<td width="50%">

**Traditional Git Workflow**

```bash
# Developing feature A...
$ git status
# Lots of modified files

# 😱 Urgent Bug B arrives!
$ git stash              # Save current state
$ git checkout -b fix-b  # Switch branch
# Fix Bug B...
$ git commit && git push
$ git checkout feature-a # Switch back
$ git stash pop          # Restore state
# 💥 May have conflicts...
```

**Problems**:
- ❌ Frequent stash/pop, error-prone
- ❌ Branch switching interrupts flow
- ❌ Risk of code conflicts
- ❌ No true parallel development

</td>
<td width="50%">

**Using multi-repo-dev**

```bash
# Terminal 1: Developing feature A
$ cd workspace/feature-a/project
$ # Keep developing, no changes needed! ✅

# Terminal 2: Open new CLI, handle Bug B
$ claude-code
> "Fix user login timeout bug"

# ✨ Auto-creates workspace/fix-login/
# ✨ Auto-clones code
# ✨ Auto-creates branch

$ # Fix, commit, push, done!

# Feature A and Bug B completely isolated!
```

**Advantages**:
- ✅ Zero switching cost
- ✅ Complete isolation
- ✅ True parallelism
- ✅ 10x faster

</td>
</tr>
</table>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎯 Core Capabilities

- **💬 AI Full Auto-Configuration**
  Configure through conversation, zero barrier

- **🚀 Parallel Development, Zero-Cost Switching**
  Open new CLI, create new workspace in seconds

- **🗂️ Independent Workspace Isolation**
  Each task in separate directory, no interference

- **🔄 Automatic Git Cloning**
  One-click pull multiple projects to workspace

</td>
<td width="50%">

### 🛠️ Additional Features

- **🌿 Unified Branch Management**
  Auto-create same-name branches, keep consistent

- **📦 Simpler Than Worktree**
  Direct clone to new directory, more flexible

- **🧹 Workspace Cleanup**
  Batch cleanup completed work, free up space

- **📝 Metadata Tracking**
  Record workspace status and branch info

</td>
</tr>
</table>

---

## 📦 Installation

> 💡 **AI Assistant**: If you're an AI, see [QUICK_INSTALL.md](QUICK_INSTALL.md) for installation steps.

### Method 1: One-Click Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
```

### Method 2: NPM Install

```bash
npm install -g @yonsun-w/multi-repo-dev
multi-repo-dev-install
```

### Method 3: Git Clone

```bash
cd ~/.claude/skills
git clone https://github.com/Yonsun-w/multi-repo-dev.git
cd multi-repo-dev
bash quickstart.sh
```

---

## 🚀 Quick Start

### 💬 Let AI Configure for You (Recommended)

**After installation, just start a conversation:**

```
You: "Help me configure multi-repo-dev"

Claude: Sure! Please tell me:
1. Your project repository URL?
2. Where should the workspace be?

You: "Repo is git@github.com:user/project.git, workspace at ~/workspace"

Claude: ✅ Configuration created! You can start using it now.
```

**AI will automatically:**
- ✅ Create `config.json`
- ✅ Fill in project info
- ✅ Validate config format

### 🎯 Start Development

Simply tell Claude your requirements:

```
"Develop new feature XX, involving project-a and project-b"
```

AI automatically completes:
1. ✅ Create independent workspace
2. ✅ Clone project code
3. ✅ Create development branch
4. ✅ Ready to go!

---

## 💡 Best Practices: Parallel Development, Zero-Cost Switching

### 🔥 Killer Feature: True Multi-Task Parallelism

**Scenario**: Developing feature A, urgent Bug B arrives

<table>
<tr>
<th width="50%">Terminal 1: Continue Feature A</th>
<th width="50%">Terminal 2: Handle Bug B</th>
</tr>
<tr>
<td>

```bash
# No changes needed!
$ cd workspace/feature-a/yone-cmdb
$ vim service/user.go
# Continue coding...
```

</td>
<td>

```bash
# Open new CLI
$ claude-code
> "Fix user login timeout bug"

# Claude automatically:
# ✅ Creates workspace/fix-login/
# ✅ Clones code
# ✅ Creates branch

$ cd workspace/fix-login/yone-cmdb
$ vim auth/session.go  # Fix bug
$ git commit && git push  # Done!
```

</td>
</tr>
</table>

### 📊 Comparison with Traditional Approach

| Operation | Traditional | multi-repo-dev |
|-----------|------------|----------------|
| Save state | `git stash` 😓 | **Not needed** ✅ |
| Switch branch | `git checkout` 😓 | **Not needed** ✅ |
| Code conflicts | May conflict 💥 | **Complete isolation** ✅ |
| Restore state | `git stash pop` 😓 | **Not needed** ✅ |
| Parallel capability | No parallelism ❌ | **True parallelism** ✅ |

### ✨ Real Benefits

- ✅ **Zero switching cost** - No stash, no branch switching, no restore
- ✅ **Zero mental burden** - Each task has independent environment, clear and focused
- ✅ **Zero code conflicts** - Physical isolation, impossible to conflict
- ✅ **10x-100x speedup** - Open 10 CLIs simultaneously, handle 10 tasks

---

## 🔄 Workflow

```
[Create Workspace] → [Clone Repos] → [Create Branch] → [Develop Code] → [Unified Commit] → [Cleanup Workspace]
        ↓                 ↓              ↓                 ↓                 ↓                   ↓
  Independent Dir   Auto clone    Same-name branch    Your work      Unified commit      Free up space
  Requirement       Multiple       Keep consistent     Focus on       Push branch        Optional cleanup
  isolation         projects                          development
```

---

## 💡 Usage Tips

### 1️⃣ Maximize Parallelism

```bash
# Open multiple CLI windows simultaneously
Terminal 1: Develop feature A
Terminal 2: Fix Bug B
Terminal 3: Refactor module C
Terminal 4: Optimize performance D
# ... 10, 100 tasks in parallel!
```

### 2️⃣ Common Commands

#### List Workspaces

```bash
$ /multi-repo-dev list
```

**Example Output**:
```
📊 Workspace List

Workspace                                           Size      Repos
-------------------------------------------------- ---------- --------
REQ-20260404-user-auth/                            156M        2
REQ-20260403-bug-fix/                              89M         1
REQ-20260402-feature-export/                       234M        3

Total: 3 workspaces, 479 MB

💡 Tip: Use /multi-repo-dev clean to cleanup completed workspaces
```

#### Cleanup Workspaces

```bash
$ /multi-repo-dev clean
```

**Example Output**:
```
🧹 Scanning completed workspaces...

Found 2 cleanable workspaces:
1. REQ-20260401-completed-task (156 MB)
2. REQ-20260330-old-feature (234 MB)

Cleanup options:
  [Complete Delete] - Delete entire workspace (including docs)
  [Code Only] - Keep docs, delete repos/ directory
  [Skip] - Don't cleanup

✅ Cleaned 2 workspaces
📊 Space freed: 390 MB
```

---

## ⚙️ Configuration

### Method 1: AI Interactive Configuration (Recommended)

```
You: "Configure multi-repo-dev, add my project"
You: "Repository: git@github.com:user/project.git"
You: "Default branch: main"
You: "Workspace path: ~/workspace"

Claude: ✅ Configuration complete!
```

### Method 2: Manual Edit

Edit `~/.claude/skills/multi-repo-dev/config.json`:

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

## 📁 Directory Structure

```
multi-repo-dev/
├── README.md                    # This file (Chinese)
├── README.en.md                 # This file (English)
├── skill.md                     # Skill entry point
├── config.example.json          # Configuration example
├── config.json                  # Your config (need to create)
├── REQUIREMENT_TEMPLATE.md      # Requirement doc template
├── IMPLEMENTATION_TEMPLATE.md   # Implementation plan template
├── .meta.template.json          # Metadata template
└── workflows/                   # Workflow submodules
    ├── init-requirement.md      # Phase 1: Initialize
    ├── align-requirement.md     # Phase 2: Align requirement
    ├── implement.md             # Phase 3: Development
    ├── finalize.md              # Phase 4: Commit and push
    └── cleanup-workspace.md     # Phase 5: Workspace cleanup
```

---

## 🎯 Use Cases

### Case 1: Single Repository Development

```bash
$ claude-code
> "Add export feature to yone-cmdb"
# ✅ Auto-creates workspace, clones code, creates branch
```

### Case 2: Multi-Repository Coordinated Development

```bash
$ claude-code
> "Implement host info sync, involving yone-cmdb, cmdb-agent, cmdb-sync"
# ✅ Auto-clones 3 projects, creates unified branch
```

### Case 3: Urgent Bug Fix

```bash
# Feature A is in development, no need to interrupt
# Open new CLI to handle Bug B
$ claude-code
> "Fix login timeout issue"
# ✅ Completely independent workspace, no interference
```

---

## 📚 Documentation

- [QUICK_INSTALL.md](QUICK_INSTALL.md) - AI Assistant Installation Guide
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution Guidelines
- [CHANGELOG.md](CHANGELOG.md) - Version History

---

## 🤝 Contributing

Contributions are welcome! Please see [Contributing Guidelines](CONTRIBUTING.md).

---

## 🐛 Issue Reporting

<div align="center">

[![GitHub Issues](https://img.shields.io/badge/Issues-Report%20Issues-green?style=for-the-badge&logo=github)](https://github.com/Yonsun-w/multi-repo-dev/issues)
[![GitHub Discussions](https://img.shields.io/badge/Discussions-Feature%20Requests-blue?style=for-the-badge&logo=github)](https://github.com/Yonsun-w/multi-repo-dev/discussions)

</div>

---

## 📄 License

MIT © [yonsun](https://github.com/Yonsun-w)

---

<div align="center">

### 💡 Making Complex Multi-Repo Management Simple

**If you find this useful, please give it a ⭐️ Star!**

[![Star History Chart](https://api.star-history.com/svg?repos=Yonsun-w/multi-repo-dev&type=Date)](https://star-history.com/#Yonsun-w/multi-repo-dev&Date)

</div>
