# NPM 登录问题修复

## ✅ 已解决：切换到官方源

你的 npm 之前使用的是**淘宝镜像源**（npmmirror.com），它不支持发布包。

**已为你切换到官方源**：
```bash
npm config set registry https://registry.npmjs.org/
```

## 🔐 现在登录 npm

在终端中运行：

```bash
npm login
```

然后输入：
- **Username**: 你在 npmjs.com 注册的用户名
- **Password**: 密码
- **Email**: 邮箱地址
- **OTP** (如果启用了两步验证): 6位验证码

### 示例：
```
$ npm login
Username: your-username
Password:
Email: (this IS public) your-email@example.com
Enter one-time password: (如果有2FA)
Logged in on https://registry.npmjs.org/.
```

## ✅ 验证登录

```bash
npm whoami
```

应该显示你的用户名。

## 📦 然后发布

登录成功后，运行：

```bash
cd ~/Desktop/multi-repo-dev-opensource
./publish.sh
```

或手动发布：

```bash
npm publish --access public
```

## 💡 以后的使用

### 发布包时
使用官方源（已设置）：
```bash
npm config get registry
# 应该显示: https://registry.npmjs.org/
```

### 安装包时
如果想用淘宝镜像加速下载，可以临时使用：
```bash
npm install --registry=https://registry.npmmirror.com
```

### 或者使用 nrm 管理源

安装 nrm：
```bash
npm install -g nrm
```

切换源：
```bash
nrm use npm     # 使用官方源（发布时）
nrm use taobao  # 使用淘宝源（安装时）
nrm ls          # 查看所有源
```

## 🔗 相关链接

- npm 官网: https://www.npmjs.com/
- 你的个人主页: https://www.npmjs.com/~your-username
- 包管理: https://www.npmjs.com/settings/your-username/packages

---

现在在终端运行 `npm login` 即可！
