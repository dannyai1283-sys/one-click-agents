# Monitoring & Health Checks

System and service monitoring with automated health checks.

## Features

- **HTTP/TCP Checks** - Monitor API endpoints and ports
- **System Monitoring** - Disk, memory, CPU checks
- **Custom Scripts** - Extend with your own checks
- **Alerting** - Notifications on failures
- **Status Pages** - Generate HTML status pages

## Quick Start

```bash
# Setup
./setup.sh

# Run health checks
~/.monitoring/health.sh check

# Start monitoring
~/.monitoring/health.sh monitor

# Check status
~/.monitoring/health.sh status
```

## Included Checks

| Check | Description |
|-------|-------------|
| `system.sh` | Disk, memory, load |
| `http.sh` | HTTP endpoint checks |

## Configuration

Edit `~/.monitoring/config.yml` to customize:

```yaml
interval: 60  # Check interval in seconds

alerting:
  slack:
    webhook: "https://hooks.slack.com/..."
    channel: "#alerts"
```

## Custom Checks

Add custom checks to `~/.monitoring/checks/`:

```bash
#!/bin/bash
# checks/my-service.sh

if curl -f http://localhost:8080/health; then
    echo "OK: My Service"
else
    echo "FAIL: My Service"
    exit 1
fi
```

Make it executable:
```bash
chmod +x ~/.monitoring/checks/my-service.sh
```

## Requirements

- Bash 4.0+
- curl
- Standard Unix tools (df, free, uptime)

## License

MIT
