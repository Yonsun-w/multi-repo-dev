#!/bin/bash

# Multi-Repo-Dev 一键安装脚本
# 使用方法: curl -fsSL https://raw.githubusercontent.com/Yonsun-w/multi-repo-dev/main/install.sh | bash

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Multi-Repo-Dev Skill 安装程序${NC}"
echo "================================"
echo ""

# 检测 Claude Code skills 目录
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"

if [ ! -d "${CLAUDE_SKILLS_DIR}" ]; then
    echo -e "${YELLOW}⚠️  Claude Code skills 目录不存在${NC}"
    echo "正在创建: ${CLAUDE_SKILLS_DIR}"
    mkdir -p "${CLAUDE_SKILLS_DIR}"
fi

# 安装目标目录
INSTALL_DIR="${CLAUDE_SKILLS_DIR}/multi-repo-dev"

# 检查是否已安装
if [ -d "${INSTALL_DIR}" ]; then
    echo -e "${YELLOW}⚠️  检测到已安装的版本${NC}"
    echo "位置: ${INSTALL_DIR}"
    echo ""
    read -p "是否覆盖安装? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}❌ 安装已取消${NC}"
        exit 0
    fi

    # 备份现有配置
    if [ -f "${INSTALL_DIR}/config.json" ]; then
        BACKUP_FILE="${INSTALL_DIR}/config.json.backup.$(date +%Y%m%d%H%M%S)"
        echo -e "${BLUE}📦 备份现有配置到: ${BACKUP_FILE}${NC}"
        cp "${INSTALL_DIR}/config.json" "${BACKUP_FILE}"
    fi

    rm -rf "${INSTALL_DIR}"
fi

# 克隆仓库
echo -e "${BLUE}📥 正在下载 multi-repo-dev...${NC}"

if command -v git &> /dev/null; then
    # 使用 git clone
    git clone --depth 1 https://github.com/Yonsun-w/multi-repo-dev.git "${INSTALL_DIR}"
else
    # 使用 curl 下载 zip
    echo -e "${YELLOW}⚠️  未检测到 git，使用 curl 下载${NC}"
    TMP_DIR=$(mktemp -d)
    curl -fsSL https://github.com/Yonsun-w/multi-repo-dev/archive/refs/heads/main.zip -o "${TMP_DIR}/multi-repo-dev.zip"

    if command -v unzip &> /dev/null; then
        unzip -q "${TMP_DIR}/multi-repo-dev.zip" -d "${TMP_DIR}"
        mv "${TMP_DIR}/multi-repo-dev-main" "${INSTALL_DIR}"
    else
        echo -e "${RED}❌ 需要安装 unzip 或 git 来完成安装${NC}"
        exit 1
    fi

    rm -rf "${TMP_DIR}"
fi

echo -e "${GREEN}✅ 下载完成${NC}"

# 恢复备份的配置
if [ -f "${INSTALL_DIR}/config.json.backup."* ]; then
    LATEST_BACKUP=$(ls -t "${INSTALL_DIR}"/config.json.backup.* 2>/dev/null | head -1)
    if [ -n "${LATEST_BACKUP}" ]; then
        echo -e "${BLUE}📦 恢复配置文件${NC}"
        cp "${LATEST_BACKUP}" "${INSTALL_DIR}/config.json"
    fi
fi

# 初始化配置
cd "${INSTALL_DIR}"

if [ ! -f "config.json" ]; then
    echo ""
    echo -e "${BLUE}📝 初始化配置${NC}"
    read -p "是否运行快速配置向导? (Y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        bash quickstart.sh
    else
        cp config.example.json config.json
        echo -e "${YELLOW}⚠️  已创建默认配置，请编辑 ${INSTALL_DIR}/config.json${NC}"
    fi
fi

# 验证安装
echo ""
echo -e "${BLUE}🔍 验证安装...${NC}"

REQUIRED_FILES=("SKILL.md" "skill.json" "config.example.json")
ALL_GOOD=true

for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "${INSTALL_DIR}/${file}" ]; then
        echo -e "${RED}❌ 缺少文件: ${file}${NC}"
        ALL_GOOD=false
    fi
done

if [ "${ALL_GOOD}" = true ]; then
    echo -e "${GREEN}✅ 安装验证通过${NC}"
else
    echo -e "${RED}❌ 安装验证失败，请检查文件完整性${NC}"
    exit 1
fi

# 完成
echo ""
echo -e "${GREEN}🎉 安装完成！${NC}"
echo ""
echo "================================"
echo -e "${BLUE}📍 安装位置:${NC} ${INSTALL_DIR}"
echo ""
echo -e "${BLUE}🎯 使用方法:${NC}"
echo "  1. 在 Claude Code 中输入: /multi-repo-dev start"
echo "  2. 或者直接说: \"我要开发一个新需求\""
echo ""
echo -e "${BLUE}📚 查看文档:${NC}"
echo "  cat ${INSTALL_DIR}/README.md"
echo ""
echo -e "${BLUE}⚙️  编辑配置:${NC}"
echo "  vim ${INSTALL_DIR}/config.json"
echo ""
echo "================================"
