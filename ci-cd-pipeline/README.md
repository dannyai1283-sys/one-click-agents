# CI/CD Pipeline

Continuous integration and deployment automation templates.

## Features

- **GitHub Actions** workflows for Node.js, Python, Go
- **GitLab CI** configuration templates
- **Docker** build and push automation
- **Deployment** scripts for multi-environment
- **Security** scanning integration

## Quick Start

```bash
# Setup for GitHub Actions
./setup.sh github

# Setup for GitLab CI
./setup.sh gitlab
```

## Generated Workflows

### GitHub Actions
- `ci.yml` - Run tests on push/PR
- `docker.yml` - Build and push containers
- `deploy.yml` - Deploy to environments

### GitLab CI
- Full pipeline with test, build, deploy stages
- Docker-in-Docker builds
- Environment-specific deployments

## Deployment

```bash
# Deploy to staging
./deploy.sh staging

# Deploy specific version
./deploy.sh production v1.2.3
```

## Requirements

- Git repository initialized
- Access to GitHub/GitLab
- Docker (for container builds)

## License

MIT
