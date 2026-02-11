@echo off
echo 🚀 Starting AI Agents: The One-Click Blueprint...
echo [Environment Check]
if not exist ".env" (
    echo [ERROR] .env file missing. Please read the book Chapter 4.
    pause
    exit
)
openclaw start
