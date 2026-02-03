#!/bin/bash
#
# Academic Diagram Skill Installer
# https://github.com/FrancyJGLisboa/academic-diagrams
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/FrancyJGLisboa/academic-diagrams/main/install.sh | bash
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SKILL_NAME="academic-diagram"
REPO_URL="https://github.com/FrancyJGLisboa/academic-diagrams.git"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"
TEMP_DIR=$(mktemp -d)

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}       ${GREEN}Academic Diagram Skill Installer${NC}                     ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}       PaperBanana-inspired diagram generation             ${BLUE}║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is not installed${NC}"
    echo "Please install git first: https://git-scm.com/downloads"
    exit 1
fi

# Check if already installed
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}Skill already installed at: $INSTALL_DIR${NC}"
    echo ""
    read -p "Do you want to update it? (y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}Updating skill...${NC}"
        cd "$INSTALL_DIR"
        git pull origin main
        echo -e "${GREEN}✓ Skill updated successfully!${NC}"
        exit 0
    else
        echo "Installation cancelled."
        exit 0
    fi
fi

# Create parent directory
echo -e "${BLUE}Creating skills directory...${NC}"
mkdir -p "$HOME/.claude/skills"

# Clone to temp directory
echo -e "${BLUE}Downloading skill from GitHub...${NC}"
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# Copy only the skill directory
echo -e "${BLUE}Installing skill...${NC}"
cp -r "$TEMP_DIR/skills/$SKILL_NAME" "$INSTALL_DIR"

# Clean up
rm -rf "$TEMP_DIR"

# Verify installation
if [ -f "$INSTALL_DIR/SKILL.md" ]; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}                    ${GREEN}Installation Complete!${NC}                   ${GREEN}║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Skill installed to: ${BLUE}$INSTALL_DIR${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Restart Claude Code (or start a new session)"
    echo "  2. Invoke the skill with: /academic-diagram"
    echo ""
    echo -e "${BLUE}Example usage:${NC}"
    echo "  /academic-diagram"
    echo ""
    echo "  Methodology: Our model uses a transformer encoder..."
    echo "  Caption: Overview of our architecture"
    echo "  Type: Framework diagram"
    echo ""
else
    echo -e "${RED}Error: Installation failed${NC}"
    echo "SKILL.md not found at $INSTALL_DIR"
    exit 1
fi
