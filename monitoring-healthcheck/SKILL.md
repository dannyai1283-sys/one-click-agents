---
name: monitoring-healthcheck
description: System monitoring and health check templates for services, APIs, and infrastructure. Includes uptime monitoring, alerting, and status page generation.
homepage: https://prometheus.io/
metadata: {"clawdbot":{"emoji":"📊","requires":{"bins":["curl","jq"]},"os":["linux","darwin","win32"]}}
---

# Monitoring & Health Checks

Monitor your services, APIs, and infrastructure health with automated checks and alerting.

## When to Use

- Monitoring API uptime and response times
- Checking service health
- Database connectivity monitoring
- SSL certificate expiration alerts
- Disk space and resource monitoring
- Generating status pages

## Quick Start

```bash
# Setup monitoring
./setup.sh

# Add health check
openclaw health add https://api.example.com/health --name "API"

# Run checks
openclaw health check

# Start monitoring daemon
openclaw health monitor --interval 60

# View status
openclaw health status
```

## Health Check Types

### HTTP/HTTPS Endpoint

```bash
# Basic health check
openclaw health add https://api.example.com/health \
    --name "Main API" \
    --interval 60 \
    --timeout 10

# With expected response
openclaw health add https://api.example.com/health \
    --name "API with validation" \
    --expect-status 200 \
    --expect-body '{"status":"ok"}' \
    --expect-header "Content-Type: application/json"

# With authentication
openclaw health add https://api.example.com/admin/health \
    --name "Admin API" \
    --header "Authorization: Bearer $API_TOKEN"
```

### TCP Port Check

```bash
# Check if port is open
openclaw health tcp localhost:5432 \
    --name "PostgreSQL" \
    --interval 30

# With connection test
openclaw health tcp redis.example.com:6379 \
    --name "Redis" \
    --send "PING" \
    --expect "+PONG"
```

### Database Check

```bash
# PostgreSQL
openclaw health postgres "postgresql://user:pass@localhost/db" \
    --name "Main DB" \
    --query "SELECT 1"

# MySQL
openclaw health mysql "user:pass@tcp(localhost:3306)/db" \
    --name "Analytics DB"

# MongoDB
openclaw health mongodb "mongodb://localhost:27017" \
    --name "Document Store"
```

### SSL Certificate Check

```bash
# Check certificate expiration
openclaw health ssl example.com \
    --name "SSL Cert" \
    --warn-days 30 \
    --critical-days 7
```

### Disk Space Check

```bash
# Monitor disk usage
openclaw health disk / \
    --name "Root Disk" \
    --warn 80 \
    --critical 90

# Multiple partitions
openclaw health disk /var/log \
    --name "Log Partition" \
    --warn 85
```

### Process Check

```bash
# Ensure process is running
openclaw health process nginx \
    --name "Web Server"

# With count check
openclaw health process worker \
    --name "Workers" \
    --min-count 3
```

## Configuration

### Health Check Config File

```yaml
# health-checks.yml
checks:
  - name: "Main API"
    type: http
    url: https://api.example.com/health
    interval: 60
    timeout: 10
    retries: 3
    expect:
      status: 200
      body_contains: '"status":"healthy"'
    alert:
      on_failure: true
      consecutive_failures: 2
  
  - name: "Database"
    type: postgres
    connection: "${DATABASE_URL}"
    query: "SELECT 1"
    interval: 30
    timeout: 5
  
  - name: "Redis"
    type: tcp
    host: localhost
    port: 6379
    interval: 30
  
  - name: "SSL Certificate"
    type: ssl
    domain: example.com
    interval: 86400  # Daily
    warn_days: 30
    critical_days: 7

notifications:
  slack:
    webhook: "${SLACK_WEBHOOK_URL}"
    channel: "#alerts"
  
  email:
    smtp_host: smtp.gmail.com
    smtp_port: 587
    username: "${EMAIL_USER}"
    password: "${EMAIL_PASS}"
    to: "ops@example.com"
  
  webhook:
    url: "https://example.com/webhook/health"
    headers:
      Authorization: "Bearer ${WEBHOOK_TOKEN}"
```

## Running Checks

### One-Time Check

```bash
# Check all services
openclaw health check

# Check specific service
openclaw health check "Main API"

# Verbose output
openclaw health check --verbose
```

### Continuous Monitoring

```bash
# Start monitoring daemon
openclaw health monitor --config health-checks.yml

# Background mode
openclaw health monitor --daemon

# Stop monitoring
openclaw health monitor --stop
```

### Scheduled Checks

```bash
# Add to cron (check every 5 minutes)
echo "*/5 * * * * $(which openclaw) health check --quiet || curl -X POST $ALERT_WEBHOOK" | crontab -
```

## Alerting

### Slack Integration

```bash
# Configure Slack alerts
openclaw health config slack \
    --webhook https://hooks.slack.com/services/xxx \
    --channel "#alerts"

# Test alert
openclaw health alert test
```

### Email Alerts

```bash
# Configure email
openclaw health config email \
    --smtp smtp.gmail.com:587 \
    --user alerts@example.com \
    --pass "$EMAIL_PASSWORD" \
    --to ops@example.com
```

### Webhook Alerts

```bash
# Custom webhook
openclaw health config webhook \
    --url https://example.com/webhook/health \
    --header "Authorization: Bearer $TOKEN"
```

### Alert Rules

```yaml
# Alert when service fails 3 times in a row
alert_rules:
  - name: "Service Down"
    condition: "consecutive_failures >= 3"
    severity: critical
    notification: [slack, email]
  
  - name: "Slow Response"
    condition: "response_time > 5s"
    severity: warning
    notification: [slack]
  
  - name: "SSL Expiring"
    condition: "ssl_days_remaining <= 7"
    severity: critical
    notification: [email]
```

## Status Page

### Generate Status Page

```bash
# Generate HTML status page
openclaw health status-page --output ./public/status.html

# Auto-update every minute
openclaw health status-page --watch --interval 60

# Include incident history
openclaw health status-page --with-history
```

### Status Page Template

```html
<!-- status.html -->
<!DOCTYPE html>
<html>
<head>
    <title>System Status</title>
    <style>
        .status-ok { color: green; }
        .status-warning { color: orange; }
        .status-critical { color: red; }
        .service {
            padding: 1rem;
            border: 1px solid #ddd;
            margin: 0.5rem 0;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>System Status</h1>
    <div id="overall-status" class="status-ok">
        All Systems Operational
    </div>
    
    <div id="services">
        {{#each services}}
        <div class="service">
            <h3>{{name}}</h3>
            <span class="status-{{status}}">{{status}}</span>
            <p>Response time: {{response_time}}ms</p>
            <p>Last checked: {{last_check}}</p>
        </div>
        {{/each}}
    </div>
    
    <footer>
        Last updated: {{timestamp}}
    </footer>
</body>
</html>
```

## Metrics and Analytics

### Collect Metrics

```bash
# Export metrics for Prometheus
openclaw health metrics --format prometheus >> /var/lib/prometheus/healthchecks.prom

# JSON metrics
openclaw health metrics --format json

# InfluxDB line protocol
openclaw health metrics --format influxdb
```

### Historical Data

```bash
# View uptime history
openclaw health history "Main API" --last 30d

# SLA report
openclaw health report --month january

# Availability stats
openclaw health stats --service "Main API"
# Output:
# Uptime: 99.95%
# Avg response: 45ms
# P95 response: 120ms
# P99 response: 250ms
# Incidents: 2
```

## Health Check Scripts

### Custom Health Script

```bash
#!/bin/bash
# Custom health check script

check_service() {
    local name=$1
    local url=$2
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url")
    status_code=$(echo "$response" | cut -d',' -f1)
    response_time=$(echo "$response" | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $name: OK (${response_time}s)"
        return 0
    else
        echo "❌ $name: FAIL (HTTP $status_code)"
        return 1
    fi
}

# Check services
check_service "API" "https://api.example.com/health"
check_service "Frontend" "https://example.com"

# Check disk
disk_usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
if [ "$disk_usage" -gt 90 ]; then
    echo "⚠️  Disk usage: ${disk_usage}%"
    exit 1
fi

echo "All checks passed!"
```

### Docker Health Check

```dockerfile
# Dockerfile
FROM node:20-alpine

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1

CMD ["node", "server.js"]
```

### Kubernetes Probe

```yaml
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: app
      image: myapp:latest
      livenessProbe:
        httpGet:
          path: /health/live
          port: 8080
        initialDelaySeconds: 30
        periodSeconds: 10
      readinessProbe:
        httpGet:
          path: /health/ready
          port: 8080
        initialDelaySeconds: 5
        periodSeconds: 5
      startupProbe:
        httpGet:
          path: /health/startup
          port: 8080
        failureThreshold: 30
        periodSeconds: 10
```

## Best Practices

1. **Meaningful Health Checks** - Test actual functionality, not just connectivity
2. **Appropriate Intervals** - Balance freshness vs. load
3. **Timeout Handling** - Set realistic timeouts
4. **Retry Logic** - Allow for transient failures
5. **Alert Fatigue** - Avoid excessive alerting
6. **Documentation** - Document what each check validates
7. **Gradual Rollout** - Test alerts in staging first

## Integration with OpenClaw

```bash
# Monitor agent health
openclaw agent health

# Report system status
openclaw agent report --health

# Self-healing actions
openclaw agent heal --restart-failed
```
