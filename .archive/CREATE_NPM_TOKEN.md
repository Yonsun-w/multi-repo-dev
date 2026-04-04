# 创建 NPM Access Token 发布指南

## 问题

即使没有启用 2FA，npm 也要求使用 Access Token 或 2FA 来发布包。

## ✅ 解决方案：创建 Access Token

### 步骤 1: 创建 Token

浏览器应该已自动打开，如果没有，访问：
https://www.npmjs.com/settings/~/tokens

或手动操作：
1. 登录 https://www.npmjs.com
2. 点击头像 → "Access Tokens"
3. 或直接访问：https://www.npmjs.com/settings/~/tokens

### 步骤 2: 生成新 Token

点击 **"Generate New Token"** 按钮

选择 Token 类型：

#### 选项 A: Classic Token（简单，推荐）

1. 选择 **"Classic Token"**
2. Token 名称：`multi-repo-dev-publish`
3. Token 类型：选择 **"Automation"** 或 **"Publish"**
4. 点击 "Generate Token"
5. **立即复制 Token**（形如：`npm_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`）

#### 选项 B: Granular Access Token（更安全）

1. 选择 **"Granular Access Token"**
2. 配置：
   - **Token name**: `multi-repo-dev-publish`
   - **Expiration**: 选择过期时间（建议 90 天或 1 年）
   - **Packages and scopes**:
     - Permissions: **"Read and write"**
     - Select packages: **"All packages"** 或选择 `@yonsun-w/multi-repo-dev`
   - **Organizations**: 不需要选择
   - **IP allowlist**: 留空（或添加你的 IP）
3. 勾选 **"Bypass 2FA"**（如果有这个选项）
4. 点击 "Generate Token"
5. **立即复制 Token**（只显示一次！）

### 步骤 3: 使用 Token 发布

#### 方法 1: 临时使用（推荐）

```bash
cd ~/Desktop/multi-repo-dev-opensource

# 将 YOUR_TOKEN_HERE 替换为你复制的 token
npm publish --access public --//registry.npmjs.org/:_authToken=YOUR_TOKEN_HERE
```

#### 方法 2: 设置到配置文件（永久）

```bash
# 将 YOUR_TOKEN_HERE 替换为你的 token
npm config set //registry.npmjs.org/:_authToken=YOUR_TOKEN_HERE

# 然后正常发布
npm publish --access public
```

#### 方法 3: 使用环境变量

```bash
# 设置环境变量
export NPM_TOKEN="YOUR_TOKEN_HERE"

# 创建或修改 ~/.npmrc
echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > ~/.npmrc

# 发布
npm publish --access public
```

## 🚀 完整流程

### 1. 获取 Token

访问 https://www.npmjs.com/settings/~/tokens 创建 Token 并复制

### 2. 发布（选择下面任一方式）

**方式 A - 一次性使用（最安全）**
```bash
cd ~/Desktop/multi-repo-dev-opensource
npm publish --access public --//registry.npmjs.org/:_authToken=npm_你的token
```

**方式 B - 保存到配置**
```bash
npm config set //registry.npmjs.org/:_authToken=npm_你的token
cd ~/Desktop/multi-repo-dev-opensource
npm publish --access public
```

### 3. 验证发布

访问：https://www.npmjs.com/package/@yonsun-w/multi-repo-dev

## ⚠️ 安全提示

1. **不要**把 Token 提交到 Git
2. **不要**在公开场合分享 Token
3. Token 泄露后立即在 npm 网站删除
4. 建议设置 Token 过期时间
5. 使用后可以删除，下次发布再创建新的

## 🔗 快速链接

- **创建 Token**: https://www.npmjs.com/settings/~/tokens
- **Token 文档**: https://docs.npmjs.com/creating-and-viewing-access-tokens
- **你的包**: https://www.npmjs.com/package/@yonsun-w/multi-repo-dev

---

## 💡 快速命令（复制后替换 token）

```bash
# 创建 token 后，运行：
cd ~/Desktop/multi-repo-dev-opensource
npm publish --access public --//registry.npmjs.org/:_authToken=npm_你复制的完整token
```

现在去创建 Token 然后发布吧！🎉
