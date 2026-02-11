#!/bin/bash
# Monitoring & Health Check Setup
# Sets up service monitoring and health checks

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

MONITOR_DIR="${HOME}/.monitoring"

create_structure() {
    log_info "Creating monitoring directory structure..."
    
    mkdir -p "$MONITOR_DIR"/{checks,logs,alerts}
    
    log_success "Directories created at $MONITOR_DIR"
}

create_health_checks() {
    log_info "Creating health check configurations..."
    
    cat > "$MONITOR_DIR/checks/system.sh" << 'EOF'
#!/bin/bash
# System health checks

# Check disk space
check_disk() {
    usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
    if [ "$usage" -gt 90 ]; then
        echo "CRITICAL: Disk usage at ${usage}%"
        return 1
    elif [ "$usage" -gt 80 ]; then
        echo "WARNING: Disk usage at ${usage}%"
        return 1
    else
        echo "OK: Disk usage at ${usage}%"
        return 0
    fi
}

# Check memory
check_memory() {
    usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
    if [ "$usage" -gt 90 ]; then
        echo "CRITICAL: Memory usage at ${usage}%"
        return 1
    else
        echo "OK: Memory usage at ${usage}%"
        return 0
    fi
}

# Check load
check_load() {
    load=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | tr -d ',')
    cpus=$(nproc)
    threshold=$(echo "$cpus * 0.8" | bc)
    
    if (( $(echo "$load > $threshold" | bc -l) )); then
        echo "WARNING: Load average ${load} (threshold: $threshold)"
        return 1
    else
        echo "OK: Load average ${load}"
        return 0
    fi
}

# Run all checks
echo "System Health Check - $(date)"
echo "=============================="
check_disk
check_memory
check_load
EOF
    chmod +x "$MONITOR_DIR/checks/system.sh"
    
    cat > "$MONITOR_DIR/checks/http.sh" << 'EOF'
#!/bin/bash
# HTTP health checks

check_url() {
    local name=$1
    local url=$2
    local expected=${3:-200}
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" --max-time 10 "$url" 2>/dev/null)
    
    if [ -z "$response" ]; then
        echo "FAIL: $name - No response"
        return 1
    fi
    
    status=$(echo "$response" | cut -d',' -f1)
    time=$(echo "$response" | cut -d',' -f2)
    
    if [ "$status" = "$expected" ]; then
        echo "OK: $name (${time}s)"
        return 0
    else
        echo "FAIL: $name (HTTP $status, expected $expected)"
        return 1
    fi
}

# Example checks (customize for your services)
echo "HTTP Health Checks - $(date)"
echo "============================"
# check_url "API" "https://api.example.com/health"
# check_url "Website" "https://example.com"
EOF
    chmod +x "$MONITOR_DIR/checks/http.sh"
    
    log_success "Health checks created"
}

create_monitoring_config() {
    log_info "Creating monitoring configuration..."
    
    cat > "$MONITOR_DIR/config.yml" << 'EOF'
# Monitoring Configuration

interval: 60  # seconds

checks:
  - name: "system"
    script: "checks/system.sh"
    enabled: true
  
  - name: "http"
    script: "checks/http.sh"
    enabled: false  # Enable and configure URLs

alerting:
  log_file: "logs/alerts.log"
  
  # Uncomment to enable notifications
  # slack:
  #   webhook: "${SLACK_WEBHOOK_URL}"
  #   channel: "#alerts"
  
  # email:
  #   smtp: "smtp.gmail.com:587"
  #   from: "alerts@example.com"
  #   to: "ops@example.com"

retention:
  logs_days: 30
  history_days: 90
EOF
    
    log_success "Configuration created"
}

create_cli() {
    log_info "Creating monitoring CLI..."
    
    cat > "$MONITOR_DIR/health.sh" << 'EOF'
#!/bin/bash
# Health monitoring CLI

MONITOR_DIR="$HOME/.monitoring"

usage() {
    echo "Usage: health {check|monitor|status|help}"
    echo ""
    echo "Commands:"
    echo "  check       Run health checks once"
    echo "  monitor     Start continuous monitoring"
    echo "  status      Show current status"
    echo "  help        Show this help"
}

run_checks() {
    local failed=0
    
    for script in "$MONITOR_DIR"/checks/*.sh; do
        if [ -x "$script" ]; then
            echo ""
            bash "$script" || failed=$((failed + 1))
        fi
    done
    
    return $failed
}

case "${1:-}" in
    check)
        echo "Running health checks..."
        run_checks
        ;;
    monitor)
        interval=${2:-60}
        echo "Starting monitoring (interval: ${interval}s)..."
        while true; do
            run_checks
            echo ""
            echo "Next check in ${interval}s..."
            sleep "$interval"
        done
        ;;
    status)
        echo "Health Check Status"
        echo "==================="
        echo "Config: $MONITOR_DIR/config.yml"
        echo "Checks:"
        ls -1 "$MONITOR_DIR"/checks/*.sh 2>/dev/null || echo "  No checks configured"
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        usage
        exit 1
        ;;
esac
EOF
    chmod +x "$MONITOR_DIR/health.sh"
    
    # Create wrapper in bin
    mkdir -p "$HOME/bin"
    ln -sf "$MONITOR_DIR/health.sh" "$HOME/bin/health" 2>/dev/null || true
    
    log_success "CLI created"
}

main() {
    echo "========================================"
    echo "  Monitoring & Health Check Setup"
    echo "========================================"
    echo ""
    
    create_structure
    create_health_checks
    create_monitoring_config
    create_cli
    
    echo ""
    log_success "Monitoring configured! 📊"
    echo ""
    echo "Directory: $MONITOR_DIR"
    echo ""
    echo "Quick start:"
    echo "  $MONITOR_DIR/health.sh check    # Run checks once"
    echo "  $MONITOR_DIR/health.sh monitor  # Continuous monitoring"
    echo "  $MONITOR_DIR/health.sh status   # Show status"
    echo ""
    echo "Next steps:"
    echo "  1. Edit $MONITOR_DIR/checks/http.sh"
    echo "  2. Add your service URLs"
    echo "  3. Configure alerting in config.yml"
    echo "  4. Run health check"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/monitoring-healthcheck/setup.sh
