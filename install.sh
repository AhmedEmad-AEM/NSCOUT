#!/usr/bin/env bash
# NScout Installation Script
# Team: AHMED EMAD | MOHAMED NAGY | ABDALLAH NEGEADA | ABDALLAH SALMAN

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  NScout - Installation Script${NC}"
echo -e "${GREEN}========================================${NC}"

# Check for nmap
if ! command -v nmap >/dev/null 2>&1; then
    echo -e "${YELLOW}nmap not found. Attempting to install...${NC}"
    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y nmap
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y nmap
    elif command -v yum >/dev/null 2>&1; then
        sudo yum install -y nmap
    elif command -v brew >/dev/null 2>&1; then
        brew install nmap
    else
        echo -e "${RED}Could not install nmap automatically. Please install it manually.${NC}"
        exit 1
    fi
fi

if ! command -v nmap >/dev/null 2>&1; then
    echo -e "${RED}nmap is still not available. Please install it manually.${NC}"
    exit 1
fi

echo -e "${GREEN}nmap is installed.${NC}"

# Determine installation directories
PRIMARY_DIR="/usr/local/bin"
SECONDARY_DIR="/usr/bin"
SCRIPT_NAME="nscout"
SOURCE_FILE="nscout"

if [ ! -f "$SOURCE_FILE" ]; then
    echo -e "${RED}Error: $SOURCE_FILE not found in current directory.${NC}"
    echo "Please run this script from the directory containing the nscout script."
    exit 1
fi

# Install to primary location (/usr/local/bin)
echo -e "\n${GREEN}Installing NScout to $PRIMARY_DIR/$SCRIPT_NAME...${NC}"
sudo cp "$SOURCE_FILE" "$PRIMARY_DIR/$SCRIPT_NAME"
sudo chmod +x "$PRIMARY_DIR/$SCRIPT_NAME"

# Create symlink in /usr/bin so sudo can find it
echo -e "${GREEN}Creating symlink in $SECONDARY_DIR/$SCRIPT_NAME...${NC}"
sudo ln -sf "$PRIMARY_DIR/$SCRIPT_NAME" "$SECONDARY_DIR/$SCRIPT_NAME"

# Verify installation (normal user)
if command -v nscout >/dev/null 2>&1; then
    echo -e "\n${GREEN}✅ NScout installed successfully!${NC}"
    echo -e "You can now run it by typing: ${YELLOW}nscout${NC}"
else
    echo -e "\n${YELLOW}Installation completed, but 'nscout' may not be in your PATH.${NC}"
    echo "You can run it with: $PRIMARY_DIR/$SCRIPT_NAME"
fi

# Verify sudo access
if sudo -n true 2>/dev/null; then
    if sudo command -v nscout >/dev/null 2>&1; then
        echo -e "${GREEN}✅ 'sudo nscout' will also work.${NC}"
    else
        echo -e "${YELLOW}⚠️  'sudo nscout' might still not work. Try: sudo /usr/bin/nscout${NC}"
    fi
else
    echo -e "${YELLOW}Note: If you need 'sudo nscout', ensure /usr/bin is in sudo's secure_path.${NC}"
fi

echo -e "\n${GREEN}Thank you for installing NScout!${NC}"
echo -e "Happy scanning! 📡"
