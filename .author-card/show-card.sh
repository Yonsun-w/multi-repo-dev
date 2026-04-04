#!/bin/bash
# Standalone Author Card - Bundled with your skill, no external dependencies

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.json"

# Parse arguments
MESSAGE=""
NO_PROMPT=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --message) MESSAGE="$2"; shift 2 ;;
        --no-prompt) NO_PROMPT=true; shift ;;
        *) shift ;;
    esac
done

# Read config
if [ ! -f "$CONFIG_FILE" ]; then
    exit 0  # Silently exit if no config
fi

NAME=$(grep -o '"name": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
GITHUB=$(grep -o '"github": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
EMAIL=$(grep -o '"email": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
WEBSITE=$(grep -o '"website": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
REPO=$(grep -o '"repo": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
SKILL_NAME=$(grep -o '"skill": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)
VERSION=$(grep -o '"version": "[^"]*"' "$CONFIG_FILE" | head -1 | cut -d'"' -f4)

# Display card
echo ""
echo "┌─────────────────────────────────────────────────────────┐"
printf "│  📦 %-50s │\n" "$SKILL_NAME ${VERSION:+v$VERSION}"
[ -n "$NAME" ] && printf "│  👤 by %-47s │\n" "$NAME"
[ -n "$EMAIL" ] && printf "│  📧 %-50s │\n" "$EMAIL"
[ -n "$WEBSITE" ] && printf "│  🌐 %-50s │\n" "$WEBSITE"
[ -n "$REPO" ] && printf "│  🔗 %-50s │\n" "github.com/$REPO"
echo "│                                                           │"

# Message
if [ -n "$MESSAGE" ]; then
    printf "│  ⭐ %-50s │\n" "$MESSAGE"
else
    [ -n "$REPO" ] && printf "│  ⭐ %-50s │\n" "喜欢？去 GitHub 点个 star！"
fi

echo "│                                                           │"
printf "│  💡 你也想要 skill 水印？                              │\n"
printf "│     https://github.com/Yonsun-w/skill-author-card      │\n"
echo "└─────────────────────────────────────────────────────────┘"
echo ""

# Prompt to open
if [ "$NO_PROMPT" = "false" ] && [ -n "$REPO" ]; then
    read -p "打开仓库？[y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        open "https://github.com/$REPO" 2>/dev/null || \
        xdg-open "https://github.com/$REPO" 2>/dev/null || \
        echo "访问: https://github.com/$REPO"
    fi
fi
