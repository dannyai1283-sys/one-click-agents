# OpenClaw One-Click Setup Templates

A collection of production-ready templates for OpenClaw one-click setup, derived from analyzing 2,999+ community skills.

## Template Categories

| Template | Description | Use Case |
|----------|-------------|----------|
| `docker-dev-environment/` | Docker sandbox templates | Isolated dev environments |
| `git-workflow/` | Advanced git automation | PR automation, branch management |
| `multi-agent-orchestration/` | Agent swarm templates | Multi-agent task coordination |
| `web-scraping-automation/` | Browser automation templates | Data extraction, monitoring |
| `productivity-system/` | Task/time tracking templates | Personal productivity automation |
| `ci-cd-pipeline/` | Deployment automation | Build, test, deploy workflows |
| `code-review-automation/` | PR review templates | Automated code review assistance |
| `monitoring-healthcheck/` | System monitoring templates | Health checks, alerting |

## Quick Start

```bash
# Navigate to desired template
cd docker-dev-environment/

# Read the SKILL.md for setup instructions
cat SKILL.md

# Run the setup script
./setup.sh
```

## Template Structure

Each template includes:
- `README.md` - Overview and getting started guide
- `SKILL.md` - Agent skill following OpenClaw conventions
- `setup.sh` / `setup.py` - Automated setup scripts
- `examples/` - Example configurations and use cases
- `.env.example` - Environment variable templates

## Key Insights from Awesome-Skills Analysis

### High-Value Patterns
1. **Workflow Integration**: Skills that integrate multiple tools (gh + git + Docker)
2. **Safety First**: Sandboxing and isolation for untrusted operations
3. **Progressive Disclosure**: Basic commands → Advanced workflows
4. **Error Recovery**: Clear troubleshooting and rollback procedures

### Common Requirements
- Binary dependencies (docker, git, gh, npm, etc.)
- Environment variables for API keys
- OS-specific considerations (Linux/macOS/Windows)
- Network access controls

### Metadata Standards
```yaml
metadata:
  clawdbot:
    emoji: "🐳"
    requires:
      bins: ["docker", "git"]
      env: ["GITHUB_TOKEN", "DOCKER_REGISTRY"]
    os: ["linux", "darwin", "win32"]
```

## Contributing

When creating new templates:
1. Follow the SKILL.md format from existing templates
2. Include practical examples, not just documentation
3. Add error handling and security considerations
4. Test on multiple platforms when possible

## License

MIT - See individual template directories for specific licensing.
