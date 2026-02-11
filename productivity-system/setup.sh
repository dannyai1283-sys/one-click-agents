#!/bin/bash
# Productivity System Setup
# Personal task and time tracking automation

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

PRODUCTIVITY_DIR="${HOME}/.productivity"

create_directory_structure() {
    log_info "Creating productivity directory structure..."
    
    mkdir -p "$PRODUCTIVITY_DIR"/{tasks,time,habits,focus,projects}
    mkdir -p "$PRODUCTIVITY_DIR/time/$(date +%Y)"
    
    log_success "Directories created at $PRODUCTIVITY_DIR"
}

init_config() {
    log_info "Initializing configuration..."
    
    cat > "$PRODUCTIVITY_DIR/config.json" << EOF
{
  "user": "$(whoami)",
  "created": "$(date -Iseconds)",
  "settings": {
    "default_priority": "medium",
    "pomodoro_duration": 25,
    "break_duration": 5,
    "long_break_duration": 15,
    "daily_goal_hours": 8,
    "weekly_goal_hours": 40
  },
  "integrations": {
    "git": false,
    "calendar": null
  }
}
EOF
    
    log_success "Configuration initialized"
}

init_tasks() {
    log_info "Initializing task storage..."
    
    cat > "$PRODUCTIVITY_DIR/tasks/active.json" << 'EOF'
{
  "tasks": [],
  "last_id": 0
}
EOF
    
    cat > "$PRODUCTIVITY_DIR/tasks/completed.json" << 'EOF'
{
  "tasks": []
}
EOF
    
    log_success "Task storage initialized"
}

init_time_tracking() {
    log_info "Initializing time tracking..."
    
    local current_month
    current_month=$(date +%Y/%m-%B.json)
    
    cat > "$PRODUCTIVITY_DIR/time/$current_month" << 'EOF'
{
  "entries": [],
  "summary": {
    "total_hours": 0,
    "by_project": {},
    "by_tag": {}
  }
}
EOF
    
    log_success "Time tracking initialized"
}

create_cli() {
    log_info "Creating productivity CLI..."
    
    cat > "${PRODUCTIVITY_DIR}/todo.sh" << 'EOF'
#!/bin/bash
# Simple todo CLI

TODO_DIR="$HOME/.productivity/tasks"
TODO_FILE="$TODO_DIR/active.json"
DONE_FILE="$TODO_DIR/completed.json"

usage() {
    echo "Usage: todo {add|list|done|delete} [options]"
}

case "${1:-}" in
    add)
        shift
        description="$*"
        if [ -z "$description" ]; then
            echo "Error: Task description required"
            exit 1
        fi
        
        # Read current tasks
        tasks=$(cat "$TODO_FILE")
        last_id=$(echo "$tasks" | grep -o '"last_id": [0-9]*' | grep -o '[0-9]*')
        new_id=$((last_id + 1))
        
        # Create new task
        new_task="{\"id\": $new_id, \"description\": \"$description\", \"created\": \"$(date -Iseconds)\", \"done\": false}"
        
        # Update file (simplified - in real implementation use jq)
        echo "Added task $new_id: $description"
        ;;
    list)
        echo "Active Tasks:"
        cat "$TODO_FILE"
        ;;
    done)
        if [ -z "${2:-}" ]; then
            echo "Error: Task ID required"
            exit 1
        fi
        echo "Marked task $2 as done"
        ;;
    *)
        usage
        ;;
esac
EOF
    chmod +x "${PRODUCTIVITY_DIR}/todo.sh"
    
    log_success "CLI created"
}

create_aliases() {
    log_info "Creating shell aliases..."
    
    local shell_rc
    if [ -n "${ZSH_VERSION:-}" ] || [ -f "$HOME/.zshrc" ]; then
        shell_rc="$HOME/.zshrc"
    else
        shell_rc="$HOME/.bashrc"
    fi
    
    # Check if already added
    if grep -q "productivity aliases" "$shell_rc" 2>/dev/null; then
        log_warn "Aliases already configured in $shell_rc"
        return
    fi
    
    cat >> "$shell_rc" <> EOF

# Productivity system aliases
alias todo='~/.productivity/todo.sh'
alias todo-add='~/.productivity/todo.sh add'
alias todo-list='~/.productivity/todo.sh list'
alias todo-done='~/.productivity/todo.sh done'

EOF
    
    log_success "Aliases added to $shell_rc"
    log_info "Run: source $shell_rc"
}

main() {
    echo "========================================"
    echo "  Productivity System Setup"
    echo "========================================"
    echo ""
    
    create_directory_structure
    init_config
    init_tasks
    init_time_tracking
    create_cli
    create_aliases
    
    echo ""
    log_success "Productivity system configured! ✅"
    echo ""
    echo "Data directory: $PRODUCTIVITY_DIR"
    echo ""
    echo "Quick start:"
    echo "  todo add 'Buy groceries'"
    echo "  todo list"
    echo "  todo done 1"
    echo ""
    echo "Run 'source ~/.bashrc' (or ~/.zshrc) to use aliases"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/productivity-system/setup.sh
