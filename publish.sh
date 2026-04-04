#!/bin/bash

# NPM 发布脚本
set -e

echo "🚀 准备发布到 npm..."
echo ""

# 1. 检查登录状态
echo "1️⃣ 检查 npm 登录状态..."
if npm whoami > /dev/null 2>&1; then
    echo "✅ 已登录: $(npm whoami)"
else
    echo "❌ 未登录到 npm"
    echo "请运行: npm login"
    exit 1
fi

# 2. 检查是否有未提交的更改
echo ""
echo "2️⃣ 检查 git 状态..."
if [[ -n $(git status -s) ]]; then
    echo "⚠️  有未提交的更改:"
    git status -s
    read -p "是否继续? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# 3. 测试打包
echo ""
echo "3️⃣ 测试打包..."
npm pack --dry-run
echo ""

# 4. 确认发布
echo "📦 将要发布的包:"
echo "   名称: @yonsun-w/multi-repo-dev"
echo "   版本: $(node -p "require('./package.json').version")"
echo ""
read -p "确认发布? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 取消发布"
    exit 0
fi

# 5. 获取 OTP（如果启用了 2FA）
echo ""
read -p "请输入 npm OTP 验证码（6位数字，没有 2FA 直接回车）: " OTP

# 6. 发布
echo ""
echo "4️⃣ 发布到 npm..."
if [ -z "$OTP" ]; then
    npm publish --access public
else
    npm publish --access public --otp="$OTP"
fi

# 6. 完成
echo ""
echo "🎉 发布成功!"
echo ""
echo "查看包信息:"
echo "   https://www.npmjs.com/package/@yonsun-w/multi-repo-dev"
echo ""
echo "安装命令:"
echo "   npm install -g @yonsun-w/multi-repo-dev"
