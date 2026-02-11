# Productivity System

Personal task and time tracking automation.

## Features

- **Task Management** - Add, complete, and organize tasks
- **Time Tracking** - Log time spent on projects
- **Pomodoro Timer** - Focus sessions with breaks
- **Habit Tracking** - Build and maintain habits
- **Analytics** - Productivity reports and insights

## Quick Start

```bash
# Setup
./setup.sh

# Add tasks
todo add "Review pull requests"
todo add "Write documentation" --priority high

# View tasks
todo list

# Complete task
todo done 1
```

## Data Storage

All data stored in `~/.productivity/`:
- `tasks/` - Active and completed tasks
- `time/` - Time tracking entries
- `habits/` - Habit tracking data
- `focus/` - Focus session history

## Shell Aliases

After setup, these aliases are available:
- `todo` - Task management
- `todo-add` - Quick add task
- `todo-list` - List tasks
- `todo-done` - Complete task

## Requirements

- Bash or Zsh shell
- Standard Unix tools (date, grep)

## License

MIT
