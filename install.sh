#!/bin/bash

echo "🚀 Starting AI Agents One-Click Installation..."

# Check requirements
if ! command -v git &> /dev/null
then
    echo "❌ Git could not be found. Please install Git first."
    exit
fi

# Create necessary directories
mkdir -p logs config memory

# Install dependencies (Conceptual)
echo "📦 Installing OpenClaw engine..."
# [Actual install command would go here]

# Initial Config Setup
if [ ! -f config/openclaw.json ]; then
    cp templates/config_template.json config/openclaw.json
    echo "✅ Default configuration created."
fi

echo "✨ Installation Complete!"
echo "👉 Next steps: Open config/openclaw.json and add your Antigravity API key."
echo "👉 Then run: openclaw start"
