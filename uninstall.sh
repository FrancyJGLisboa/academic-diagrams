#!/bin/bash
#
# Academic Diagram Skill Uninstaller
# https://github.com/FrancyJGLisboa/academic-diagrams
#

set -e

SKILL_NAME="academic-diagram"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Academic Diagram Skill Uninstaller${NC}"
echo ""

if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}Skill not found at: $INSTALL_DIR${NC}"
    echo "Nothing to uninstall."
    exit 0
fi

echo -e "This will remove: ${INSTALL_DIR}"
echo ""
read -p "Are you sure you want to uninstall? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$INSTALL_DIR"
    echo -e "${GREEN}✓ Skill uninstalled successfully${NC}"
else
    echo "Uninstall cancelled."
fi
