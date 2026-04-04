#!/bin/bash

# Multi-Repo-Dev Skill 快速配置脚本

set -e

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="${SKILL_DIR}/config.json"
EXAMPLE_CONFIG="${SKILL_DIR}/config.example.json"

echo "🚀 Multi-Repo-Dev Skill 快速配置"
echo "================================"
echo ""

# 1. 检查配置文件
if [ -f "${CONFIG_FILE}" ]; then
    echo "✅ 配置文件已存在: ${CONFIG_FILE}"
    read -p "是否覆盖? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "跳过配置创建"
        exit 0
    fi
fi

# 2. 创建配置
echo "📝 创建配置文件..."
cp "${EXAMPLE_CONFIG}" "${CONFIG_FILE}"

# 3. 检测当前项目
CURRENT_DIR="$(pwd)"
if [ -d "${CURRENT_DIR}/.git" ]; then
    GIT_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
    GIT_BRANCH=$(git branch --show-current 2>/dev/null || echo "master")
    PROJECT_NAME=$(basename "${CURRENT_DIR}")

    echo ""
    echo "🔍 检测到当前项目:"
    echo "   名称: ${PROJECT_NAME}"
    echo "   路径: ${CURRENT_DIR}"
    echo "   仓库: ${GIT_REMOTE}"
    echo "   分支: ${GIT_BRANCH}"
    echo ""

    read -p "是否将当前项目添加到配置? (Y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        # 使用 jq 更新配置 (如果有的话)
        if command -v jq &> /dev/null; then
            TMP_FILE=$(mktemp)
            jq --arg name "${PROJECT_NAME}" \
               --arg repo "${GIT_REMOTE}" \
               --arg branch "${GIT_BRANCH}" \
               --arg path "${CURRENT_DIR}" \
               '.projects[$name] = {
                   "repo": $repo,
                   "branch": $branch,
                   "localPath": $path,
                   "tech": ["Unknown"],
                   "description": "Auto-detected project"
               }' "${CONFIG_FILE}" > "${TMP_FILE}"
            mv "${TMP_FILE}" "${CONFIG_FILE}"
            echo "✅ 项目已添加到配置"
        else
            echo "⚠️  请手动编辑 config.json 添加项目"
        fi
    fi
fi

# 4. 设置工作区路径
DEFAULT_WORKSPACE="${HOME}/Project/requirements"
echo ""
echo "📁 设置需求工作区路径"
echo "   默认: ${DEFAULT_WORKSPACE}"
read -p "   使用默认路径? (Y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    WORKSPACE_PATH="${DEFAULT_WORKSPACE}"
else
    read -p "   请输入工作区路径: " WORKSPACE_PATH
fi

# 创建工作区目录
mkdir -p "${WORKSPACE_PATH}"

# 更新配置
if command -v jq &> /dev/null; then
    TMP_FILE=$(mktemp)
    jq --arg path "${WORKSPACE_PATH}" \
       '.workspace = $path' "${CONFIG_FILE}" > "${TMP_FILE}"
    mv "${TMP_FILE}" "${CONFIG_FILE}"
fi

echo "✅ 工作区路径已设置: ${WORKSPACE_PATH}"

# 5. 验证配置
echo ""
echo "🔍 验证配置..."
if command -v jq &> /dev/null; then
    if jq empty "${CONFIG_FILE}" 2>/dev/null; then
        echo "✅ 配置文件格式正确"
    else
        echo "❌ 配置文件格式错误,请检查 JSON 语法"
        exit 1
    fi
else
    echo "⚠️  未安装 jq,跳过格式验证"
fi

# 6. 显示配置摘要
echo ""
echo "📋 配置摘要"
echo "================================"
echo "配置文件: ${CONFIG_FILE}"
echo "工作区: ${WORKSPACE_PATH}"
echo ""
if command -v jq &> /dev/null; then
    echo "项目列表:"
    jq -r '.projects | keys[]' "${CONFIG_FILE}" | while read -r project; do
        echo "  - ${project}"
    done
fi

# 7. 下一步提示
echo ""
echo "✅ 配置完成!"
echo ""
echo "🎯 下一步:"
echo "1. 编辑配置文件添加更多项目:"
echo "   vim ${CONFIG_FILE}"
echo ""
echo "2. 在 Claude Code 中使用:"
echo "   /multi-repo-dev start"
echo "   或直接说: \"我要开发一个新需求\""
echo ""
echo "3. 查看文档:"
echo "   cat ${SKILL_DIR}/README.md"
echo ""
