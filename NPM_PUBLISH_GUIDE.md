# NPM 发布指南

## 📋 发布前准备

### 1. 注册 npm 账号

如果还没有 npm 账号：

访问 https://www.npmjs.com/signup 注册账号

### 2. 登录 npm

```bash
npm login
```

输入：
- Username: 你的用户名
- Password: 密码
- Email: 邮箱
- 2FA Code: 如果启用了两步验证

### 3. 验证登录状态

```bash
npm whoami
```

应该显示你的用户名。

## 📦 准备发布

### 1. 检查 package.json

当前配置：
- ✅ name: `@yonsun-w/multi-repo-dev` (scoped package)
- ✅ version: `1.0.0`
- ✅ description: 完整
- ✅ repository: GitHub 地址
- ✅ keywords: 丰富的关键词
- ⚠️ author email: 需要更新为真实邮箱

### 2. 更新 author 信息

编辑 `package.json`：

```json
"author": "yonsun <your-real-email@example.com>",
```

或者使用 GitHub 邮箱：
```json
"author": "yonsun <your-github-username@users.noreply.github.com>",
```

### 3. 测试打包

```bash
cd ~/Desktop/multi-repo-dev-opensource

# 查看将要发布的文件
npm pack --dry-run

# 实际打包（生成 .tgz 文件）
npm pack
```

### 4. 检查 .npmignore

创建 `.npmignore` 文件（如果需要排除某些文件）：

```bash
cat > .npmignore << 'EOF'
# 开发文件
开源完成总结.md
CREATE_RELEASE_GUIDE.md
GITHUB_SETUP_GUIDE.md
NPM_PUBLISH_GUIDE.md
RELEASE_NOTES_v1.0.0.md

# Git 文件
.git
.gitignore

# 临时文件
*.log
*.tmp
.DS_Store
EOF
```

## 🚀 发布到 NPM

### 方式 1: 发布 scoped package（推荐）

Scoped package 需要指定 access 为 public：

```bash
cd ~/Desktop/multi-repo-dev-opensource

# 发布为公开包
npm publish --access public
```

### 方式 2: 修改为非 scoped package

如果不想使用 scoped package，修改 `package.json`：

```json
"name": "multi-repo-dev",
```

然后发布：

```bash
npm publish
```

### 注意事项

1. **版本号不能重复**：如果发布失败，需要修改版本号
2. **24小时内不能删除后重新发布相同版本**
3. **发布后等待几分钟才能搜索到**

## ✅ 验证发布

### 1. 检查 npm 网站

访问：https://www.npmjs.com/package/@yonsun-w/multi-repo-dev

### 2. 测试安装

```bash
# 测试安装到临时目录
cd /tmp
npm install -g @yonsun-w/multi-repo-dev

# 验证安装
which multi-repo-dev-install
multi-repo-dev-install --help || echo "安装成功"
```

### 3. 卸载测试

```bash
npm uninstall -g @yonsun-w/multi-repo-dev
```

## 📝 更新版本

以后更新时：

```bash
# 更新补丁版本 (1.0.0 -> 1.0.1)
npm version patch

# 更新次要版本 (1.0.0 -> 1.1.0)
npm version minor

# 更新主要版本 (1.0.0 -> 2.0.0)
npm version major

# 推送 tag 到 GitHub
git push origin --tags

# 发布到 npm
npm publish --access public
```

## 🔧 常见问题

### 问题 1: 403 Forbidden

**原因**: scoped package 默认是私有的

**解决**:
```bash
npm publish --access public
```

### 问题 2: 包名已存在

**原因**: 有人已经使用了这个包名

**解决**:
- 使用 scoped package: `@username/package-name`
- 或者换一个包名

### 问题 3: 需要验证邮箱

**原因**: npm 账号邮箱未验证

**解决**:
1. 登录 https://www.npmjs.com
2. 查看邮件验证链接
3. 验证后重新发布

### 问题 4: 需要两步验证

**原因**: 账号启用了 2FA

**解决**:
- 使用认证器生成的 6 位验证码
- 或在 npm 网站生成 Access Token 使用

## 📊 发布后的工作

### 1. 更新 README

添加 npm 安装方式：

```markdown
## 安装

### 方法 1: npm 安装
\`\`\`bash
npm install -g @yonsun-w/multi-repo-dev
multi-repo-dev-install
\`\`\`

### 方法 2: 一键安装
\`\`\`bash
curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash
\`\`\`
```

### 2. 添加 npm 徽章

在 README.md 顶部添加：

```markdown
[![npm version](https://img.shields.io/npm/v/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
[![npm downloads](https://img.shields.io/npm/dm/@yonsun-w/multi-repo-dev)](https://www.npmjs.com/package/@yonsun-w/multi-repo-dev)
```

### 3. 提交更新

```bash
git add README.md
git commit -m "docs: add npm installation method"
git push origin main
```

## 🎯 完整发布流程

```bash
# 1. 进入项目目录
cd ~/Desktop/multi-repo-dev-opensource

# 2. 确保代码已提交
git status

# 3. 登录 npm（如果未登录）
npm login

# 4. 测试打包
npm pack --dry-run

# 5. 发布（scoped package 需要 --access public）
npm publish --access public

# 6. 验证发布
open "https://www.npmjs.com/package/@yonsun-w/multi-repo-dev"

# 7. 更新 README 添加 npm 安装方式
# （手动编辑或使用脚本）

# 8. 提交更新
git add .
git commit -m "docs: add npm package info"
git push origin main
```

## 🔗 相关链接

- **npm 包地址**: https://www.npmjs.com/package/@yonsun-w/multi-repo-dev
- **npm 文档**: https://docs.npmjs.com/
- **Semantic Versioning**: https://semver.org/

---

准备好了就可以发布了！🚀
