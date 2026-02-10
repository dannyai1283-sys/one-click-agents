#!/bin/bash

# --- Colors for Output ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Initializing Your One-Click AI Agent...${NC}"

# 1. Directory Structure
echo -e "${BLUE}📁 Creating working directories...${NC}"
mkdir -p logs config memory templates

# 2. Check for dependencies (Basic)
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is missing. Please install it: https://git-scm.com/${NC}"
    exit 1
fi

# 3. Setup Environment File
if [ ! -f .env ]; then
    echo -e "${BLUE}📄 Creating .env from template...${NC}"
    echo "ANTIGRAVITY_API_KEY=your_key_here" > .env
    echo "TELEGRAM_BOT_TOKEN=your_token_here" >> .env
    echo -e "${GREEN}✅ .env created. Don't forget to add your keys!${NC}"
fi

# 4. Deployment Logic (Placeholder for OpenClaw install)
echo -e "${BLUE}📦 Preparing OpenClaw core...${NC}"
# In a real scenario, we would run: npm install -g openclaw

# 5. Success Message
echo -e "\n${GREEN}✨ Setup Complete! ✨${NC}"
echo -e "--------------------------------------------------"
echo -e "1. Open ${BLUE}.env${NC} and add your API keys."
echo -e "2. Run ${BLUE}openclaw start${NC} to wake up your agent."
echo -e "3. Follow the instructions in the book to start chat."
echo -e "--------------------------------------------------"
