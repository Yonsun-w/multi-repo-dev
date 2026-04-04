# 安装指南

## 方式 1: 本地安装 (推荐)

如果你已经在项目目录中:

```bash
# skill 已经在 .skills/multi-repo-dev/ 目录
# 只需要创建配置文件
cd .skills/multi-repo-dev
cp config.example.json config.json

# 编辑配置文件
vim config.json  # 或使用其他编辑器
```

## 方式 2: 通过 skills.json 注册

已自动注册到 `skills.json`:

```json
{
  "skills": {
    "multi-repo-dev": "./.skills/multi-repo-dev"
  }
}
```

## 配置说明

编辑 `config.json`,填入你的项目信息:

```json
{
  "projects": {
    "yone-cmdb": {
      "repo": "git@gitlab.com:your-group/yone-cmdb.git",
      "branch": "master",
      "localPath": "/Users/yonsun/Project/Yone-CMDB-ALL/yone-cmdb",
      "tech": ["Go", "Vue", "MySQL"],
      "description": "CMDB 主项目"
    }
  },
  "workspace": "/Users/yonsun/Project/requirements"
}
```

### 必填字段

- `projects` - 项目列表
  - `repo` - Git 仓库地址 (SSH 或 HTTPS)
  - `branch` - 默认分支 (master/main)
- `workspace` - 需求工作区路径 (绝对路径)

### 可选字段

- `localPath` - 如果项目已在本地,可提供路径(节省克隆时间)
- `tech` - 技术栈标签
- `description` - 项目描述

## 验证安装

```bash
# 在 Claude Code 中运行
/multi-repo-dev
```

应该看到 skill 的帮助信息。

## 首次使用

```bash
# 方式 1: 使用命令
/multi-repo-dev start

# 方式 2: 自然语言
"我要开发一个新需求,涉及 yone-cmdb 项目"
```

## 故障排查

### 找不到 skill

检查 `skills.json` 中的路径是否正确:

```bash
ls .skills/multi-repo-dev/skill.md
```

### Git 认证失败

确保 SSH 密钥已配置:

```bash
ssh -T git@gitlab.com
```

### 配置文件错误

验证 JSON 格式:

```bash
cat config.json | jq .
```

## 更新

拉取最新版本:

```bash
cd .skills/multi-repo-dev
git pull  # 如果是 git 仓库
```

## 卸载

```bash
# 删除 skill 目录
rm -rf .skills/multi-repo-dev

# 从 skills.json 移除
# 编辑 skills.json,删除 "multi-repo-dev" 条目
```
