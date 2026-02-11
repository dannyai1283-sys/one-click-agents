---
name: productivity-system
description: Task and time tracking automation for personal productivity. Includes todo management, pomodoro timers, time logging, and productivity analytics.
homepage: https://github.com/VoltAgent/voltagent
metadata: {"clawdbot":{"emoji":"✅","requires":{"bins":["date"]},"os":["linux","darwin","win32"]}}
---

# Productivity System

Personal task and time tracking automation. Manage todos, track time, and analyze productivity patterns.

## When to Use

- Daily task management and prioritization
- Time tracking for projects
- Pomodoro technique implementation
- Productivity analytics and insights
- Habit tracking
- Focus session management

## Quick Start

```bash
# Setup productivity system
./setup.sh

# Add a task
openclaw todo add "Review pull requests" --priority high --project work

# Start focus session
openclaw focus start --duration 25m --task "Write documentation"

# Log time
openclaw time log 2h --project "API Development" --tags coding,backend

# View daily report
openclaw report daily
```

## Task Management

### Adding Tasks

```bash
# Quick add
openclaw todo add "Buy groceries"

# With metadata
openclaw todo add "Review PRs" \
    --priority high \
    --project work \
    --due tomorrow \
    --tags code-review,urgent

# Recurring task
openclaw todo add "Weekly sync" \
    --recur weekly \
    --on friday
```

### Task Priorities

```bash
# Set priority levels
openclaw todo priority <id> high    # Urgent/important
openclaw todo priority <id> medium  # Normal priority
openclaw todo priority <id> low     # Can wait
openclaw todo priority <id> none   # No priority
```

### Task States

```bash
openclaw todo list                    # Show pending tasks
openclaw todo list --all              # Show all tasks
openclaw todo list --done             # Show completed
openclaw todo list --project work     # Filter by project

openclaw todo done <id>               # Mark as done
openclaw todo start <id>              # Start working on task
openclaw todo stop <id>               # Pause task
openclaw todo archive <id>            # Archive completed
```

### Task Organization

```bash
# Projects
openclaw project create "API Development"
openclaw project list
openclaw project archive "Old Project"

# Tags
openclaw tag create urgent
openclaw todo add "Task" --tags urgent,work
openclaw todo list --tag urgent

# Contexts (@home, @work, @errands)
openclaw todo add "Call dentist" --context @calls
openclaw todo list --context @home
```

## Time Tracking

### Manual Time Entry

```bash
# Log time
openclaw time log 2h --project "API Development"
openclaw time log 30m --project "Meetings" --tags standup

# With description
openclaw time log 1.5h \
    --project "Frontend" \
    --description "Implement user dashboard" \
    --tags react,coding
```

### Timer-Based Tracking

```bash
# Start timer
openclaw timer start --project "Bug Fixes"

# Check status
openclaw timer status

# Stop and log
openclaw timer stop

# Quick pomodoro
openclaw pomodoro start
openclaw pomodoro break
```

### Time Reports

```bash
# Today's activity
openclaw report today

# This week
openclaw report week

# By project
openclaw report project "API Development"

# By tag
openclaw report tag coding

# Export timesheet
openclaw report export --format csv --month january
```

## Focus Sessions

### Pomodoro Technique

```bash
# Start 25-minute work session
openclaw pomodoro start --task "Write code"

# Take a break
openclaw pomodoro break          # 5-minute short break
openclaw pomodoro long-break     # 15-minute long break

# Statistics
openclaw pomodoro stats          # Today's pomodoros
openclaw pomodoro streak         # Current streak
```

### Deep Work Sessions

```bash
# Block distractions during focus time
openclaw focus start --duration 90m --block-distractions

# Auto-respond to notifications
openclaw focus configure --autoreply "In deep work, back at 3pm"

# Focus music
openclaw focus music --playlist lofi

# End session
openclaw focus stop
```

### Session History

```bash
# View completed sessions
openclaw focus history

# Analyze focus patterns
openclaw focus analytics
```

## Habit Tracking

### Define Habits

```bash
# Create habit
openclaw habit create "Exercise" \
    --frequency daily \
    --goal 30m \
    --tags health

openclaw habit create "Read" \
    --frequency daily \
    --goal 20pages

openclaw habit create "Code" \
    --frequency weekly \
    --goal 5h \
    --days mon,tue,wed,thu,fri
```

### Track Habits

```bash
# Log habit completion
openclaw habit done exercise
openclaw habit done read --amount 25pages

# View streak
openclaw habit streak exercise

# Check progress
openclaw habit status
```

## Productivity Analytics

### Daily Summary

```bash
openclaw report daily
# Output:
# 📅 Daily Summary - Monday, Jan 15
# ⏱️  Time logged: 7h 30m
# ✅  Tasks completed: 8/12
# 🍅  Pomodoros: 12
# 🎯  Focus score: 85%
# 
# Top projects:
#   - API Development: 3h
#   - Frontend: 2h 30m
#   - Meetings: 1h 30m
#   - Admin: 30m
```

### Weekly Review

```bash
openclaw report weekly --last-week

# Productivity trends
openclaw trends --weeks 4

# Compare with previous periods
openclaw compare --weeks 2 --to previous
```

### Goals and Targets

```bash
# Set weekly goal
openclaw goal set --weekly 40h --project "API Development"

# Track progress
openclaw goal progress

# Adjust goal
openclaw goal adjust --weekly 35h
```

## Data Storage

### File Structure

```
~/.productivity/
├── tasks/
│   ├── active.json
│   ├── completed.json
│   └── archived/
├── time/
│   ├── 2024/
│   │   ├── 01-january.json
│   │   └── 02-february.json
│   └── current.json
├── habits/
│   ├── habits.json
│   └── streaks.json
├── focus/
│   └── sessions.json
└── config.json
```

### Export/Import

```bash
# Export all data
openclaw export --format json --output backup.json
openclaw export --format csv --output timesheet.csv

# Import from other tools
openclaw import --from todoist --file export.csv
openclaw import --from toggl --file time-entries.csv
```

## Automation and Hooks

### Daily Digest

```bash
# Configure daily summary
openclaw config daily-digest 9am

# Weekly review reminder
openclaw config weekly-review friday 4pm
```

### Git Integration

```bash
# Auto-log time from git commits
openclaw config git-integration true

# Link commits to tasks
openclaw todo link <id> --commit abc123
```

### Calendar Integration

```bash
# Sync with calendar
openclaw calendar sync --from google
openclaw calendar sync --to outlook

# Block focus time
openclaw focus block-calendar --daily 9am-11am
```

## CLI Reference

### Task Commands

```bash
openclaw todo add "Task name" [options]
  --priority, -p    high|medium|low|none
  --project, -P     Project name
  --due, -d         Due date (today, tomorrow, YYYY-MM-DD)
  --tags, -t        Comma-separated tags
  --recur, -r       daily|weekly|monthly
  --context, -c     @context

openclaw todo list [options]
  --all             Show all tasks
  --done            Show completed
  --project         Filter by project
  --tag             Filter by tag
  --priority        Filter by priority
  --context         Filter by context

openclaw todo done <id>
openclaw todo delete <id>
openclaw todo edit <id>
```

### Time Commands

```bash
openclaw time log <duration> [options]
  --project, -p     Project name
  --description, -d Description
  --tags, -t        Tags
  --date            Date (default: today)

openclaw timer start [options]
openclaw timer stop
openclaw timer status
openclaw timer cancel
```

### Report Commands

```bash
openclaw report today
openclaw report yesterday
openclaw report week [--last-week]
openclaw report month [--month MM]
openclaw report project <name>
openclaw report tag <tag>
openclaw report export --format json|csv
```

## Best Practices

1. **Capture everything** - Add tasks as soon as they come up
2. **Review daily** - Start day with task review, end with time log review
3. **Time block** - Schedule focus time for important tasks
4. **Tag consistently** - Use consistent tags for better analytics
5. **Weekly review** - Review progress and adjust goals weekly
6. **Keep it simple** - Don't over-engineer your productivity system

## Integration with OpenClaw

```bash
# Agent suggests tasks based on context
openclaw agent suggest

# Auto-log agent work time
openclaw agent track --on

# Task recommendations
openclaw agent recommend --for today
```
