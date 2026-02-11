#!/bin/bash
cd "$(dirname "$0")"
echo "🚀 Starting AI Agents: The One-Click Blueprint..."
if [ ! -f ".env" ]; then
    echo "[ERROR] .env file missing. Please read the book Chapter 4."
    exit 1
fi
openclaw start
