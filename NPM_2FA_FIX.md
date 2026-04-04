# NPM 两步验证（2FA）发布问题解决

## 问题

发布时遇到错误：
```
403 Forbidden - Two-factor authentication or granular access token with bypass 2fa enabled is required
```

这说明你的 npm 账号启用了两步验证。

## 🔐 解决方案

### 方案 1: 使用 OTP（一次性密码）发布（推荐）

在发布命令后添加 `--otp` 参数：

```bash
cd ~/Desktop/multi-repo-dev-opensource

# 从你的认证器（Google Authenticator/Authy 等）获取 6 位验证码
# 然后运行（将 123456 替换为实际验证码）：
npm publish --access public --otp=123456
```

**注意**：
- OTP 验证码会在 30 秒后过期
- 如果过期了，重新获取新的验证码再试

### 方案 2: 创建 Access Token（长期使用）

如果经常发布，可以创建一个绕过 2FA 的 Access Token：

#### 步骤 1: 创建 Token

1. 访问：https://www.npmjs.com/settings/~/tokens
2. 点击 "Generate New Token"
3. 选择 **"Granular Access Token"**
4. 配置：
   - **Token name**: `multi-repo-dev-publish`
   - **Expiration**: 选择过期时间（建议 1 年）
   - **Packages and scopes**:
     - Permissions: `Read and write`
     - Select packages: `Only select packages and scopes`
     - 选择 `@yonsun-w/multi-repo-dev`
5. 勾选 **"Bypass 2FA"**
6. 点击 "Generate Token"
7. **立即复制并保存 Token**（只显示一次！）

#### 步骤 2: 配置 Token

```bash
# 方式 A: 设置为环境变量（临时）
export NPM_TOKEN="npm_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
npm publish --access public

# 方式 B: 直接配置到 .npmrc（永久）
npm config set //registry.npmjs.org/:_authToken=npm_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
npm publish --access public

# 方式 C: 项目级别配置
echo "//registry.npmjs.org/:_authToken=npm_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" > ~/.npmrc
npm publish --access public
```

**安全提示**：
- ⚠️ Token 要保密，不要提交到 Git
- ⚠️ 如果泄露，立即在 npm 网站删除该 Token

### 方案 3: 禁用 2FA（不推荐）

如果你想完全禁用 2FA：

1. 访问：https://www.npmjs.com/settings/~/tfa
2. 禁用两步验证
3. 重新 `npm publish --access public`

**不推荐**：这会降低账号安全性。

## 🚀 推荐流程（使用 OTP）

```bash
cd ~/Desktop/multi-repo-dev-opensource

# 1. 打开你的认证器 App（Google Authenticator / Authy）
# 2. 获取 6 位 npm 验证码
# 3. 立即运行（验证码 30 秒过期）：

npm publish --access public --otp=<你的验证码>

# 示例（将 123456 替换为你的实际验证码）：
npm publish --access public --otp=123456
```

## 📝 更新 publish.sh 脚本

如果想自动化处理 OTP，可以修改 `publish.sh`：

```bash
#!/bin/bash
set -e

echo "🚀 准备发布到 npm..."

# ... 前面的检查代码 ...

# 询问 OTP
echo ""
read -p "请输入 npm OTP 验证码（6位数字）: " OTP

# 发布（带 OTP）
echo ""
echo "4️⃣ 发布到 npm..."
npm publish --access public --otp=$OTP

echo ""
echo "🎉 发布成功!"
```

## 🔗 相关链接

- **Token 管理**: https://www.npmjs.com/settings/~/tokens
- **2FA 设置**: https://www.npmjs.com/settings/~/tfa
- **npm 文档**: https://docs.npmjs.com/about-two-factor-authentication

---

## 快速命令

```bash
# 最简单：每次输入 OTP（推荐）
npm publish --access public --otp=$(read -p "OTP: " otp && echo $otp)

# 或者分两步：
# 1. 在认证器获取验证码
# 2. 运行：
npm publish --access public --otp=你的6位验证码
```

现在打开你的认证器 App，获取验证码，然后运行发布命令！🎉
