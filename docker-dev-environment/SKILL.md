---
name: docker-dev-environment
description: One-click Docker development environment setup with pre-configured containers for common tech stacks. Includes Node.js, Python, Go, and database sandboxes with volume persistence and hot-reload.
homepage: https://docs.docker.com/
metadata: {"clawdbot":{"emoji":"🐳","requires":{"bins":["docker","docker-compose"]},"os":["linux","darwin","win32"]}}
---

# Docker Dev Environment Template

Quickly spin up isolated development environments with Docker. Perfect for onboarding, testing new stacks, or keeping your host machine clean.

## When to Use

- Onboarding new developers with consistent environments
- Testing packages or dependencies without polluting your system
- Running multiple project versions side-by-side
- CI/CD pipeline testing locally
- Isolating agent workloads with network controls

## Quick Start

### One-Command Setup

```bash
# Clone this template
cp -r docker-dev-environment/ ~/projects/my-dev-env
cd ~/projects/my-dev-env

# Choose your stack and start
./setup.sh nodejs    # Node.js + MongoDB
./setup.sh python    # Python + PostgreSQL
./setup.sh go        # Go + Redis
./setup.sh fullstack # React + Node + PostgreSQL
```

## Available Stacks

### Node.js Stack
```yaml
# docker-compose.nodejs.yml
services:
  app:
    image: node:20-alpine
    volumes:
      - .:/app
      - node_modules:/app/node_modules
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    command: npm run dev
  
  mongodb:
    image: mongo:7
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db
```

### Python Stack
```yaml
# docker-compose.python.yml
services:
  app:
    image: python:3.11-slim
    volumes:
      - .:/app
    ports:
      - "8000:8000"
    environment:
      - PYTHONUNBUFFERED=1
    command: uvicorn main:app --reload --host 0.0.0.0
  
  postgres:
    image: postgres:16
    environment:
      POSTGRES_USER: dev
      POSTGRES_PASSWORD: dev
      POSTGRES_DB: app
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

### Go Stack
```yaml
# docker-compose.go.yml
services:
  app:
    image: golang:1.21-alpine
    volumes:
      - .:/go/src/app
      - go_mod:/go/pkg/mod
    ports:
      - "8080:8080"
    working_dir: /go/src/app
    command: air -c .air.toml
  
  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
```

## Commands Reference

### Lifecycle Management

```bash
# Start environment
docker-compose -f docker-compose.nodejs.yml up -d

# View logs
docker-compose logs -f app

# Execute commands
docker-compose exec app npm install package-name
docker-compose exec app bash

# Stop environment
docker-compose down

# Stop and remove volumes (⚠️ data loss)
docker-compose down -v

# Rebuild after Dockerfile changes
docker-compose up -d --build
```

### Working Inside Containers

```bash
# Install dependencies
docker-compose exec app npm install
docker-compose exec app pip install -r requirements.txt
docker-compose exec app go mod tidy

# Run tests
docker-compose exec app npm test
docker-compose exec app pytest
docker-compose exec app go test ./...

# Database operations
docker-compose exec postgres psql -U dev -d app
docker-compose exec mongodb mongosh
```

## Advanced Patterns

### Hot Reload Setup

**Node.js (package.json):**
```json
{
  "scripts": {
    "dev": "nodemon --legacy-watch src/index.js"
  }
}
```

**Python (with watchdog):**
```bash
pip install watchdog
# Use: watchmedo auto-restart --directory=./ --pattern=*.py --recursive -- python main.py
```

**Go (Air):**
```bash
# Install air in container
docker-compose exec app go install github.com/cosmtrek/air@latest
# Config in .air.toml
```

### Multi-Stage Development

```dockerfile
# Dockerfile.dev
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM base AS dev
ENV NODE_ENV=development
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS test
ENV NODE_ENV=test
COPY . .
CMD ["npm", "test"]
```

### Network Isolation

```yaml
# docker-compose.secure.yml
services:
  app:
    networks:
      - frontend
      - backend
    # No external network access except through proxy
  
  proxy:
    networks:
      - frontend
      - external
    ports:
      - "3000:3000"
  
  database:
    networks:
      - backend
    # No external access

networks:
  frontend:
  backend:
  external:
```

### Environment-Specific Configs

```bash
# .env.development
NODE_ENV=development
DATABASE_URL=postgresql://dev:dev@postgres:5432/app
REDIS_URL=redis://redis:6379

# .env.production (for testing prod builds)
NODE_ENV=production
DATABASE_URL=postgresql://prod:secret@postgres:5432/app
```

## Docker Sandbox for Agents

### Safe Package Exploration

```bash
# Create isolated sandbox
docker run --rm -it \
  --name package-test \
  --network none \
  -v $(pwd)/test:/test \
  node:20-alpine sh

# Inside container
npm install suspicious-package
# Inspect without risk to host
```

### Agent Workload Isolation

```bash
# Run agent in isolated container
docker run --rm -it \
  --name agent-workspace \
  --cap-drop ALL \
  --security-opt no-new-privileges \
  -v $(pwd):/workspace \
  -w /workspace \
  node:20-alpine sh
```

## Troubleshooting

### Port Conflicts
```bash
# Find what's using port 3000
lsof -i :3000
# or
netstat -tulpn | grep 3000

# Use different port in docker-compose.yml
ports:
  - "3001:3000"  # Host:Container
```

### Permission Issues
```bash
# Fix volume permissions (Linux)
docker-compose exec app chown -R $(id -u):$(id -g) /app

# Or run container as current user
services:
  app:
    user: "${UID}:${GID}"
```

### Slow File Sync (macOS)
```yaml
services:
  app:
    volumes:
      - .:/app:cached  # Use cached mount option
```

### Container Won't Start
```bash
# Check logs
docker-compose logs app

# Validate compose file
docker-compose config

# Check resource usage
docker stats
```

### Database Connection Issues
```bash
# Wait for database to be ready
docker-compose exec app sh -c '
  until nc -z postgres 5432; do
    echo "Waiting for postgres..."
    sleep 1
  done
'
```

## Best Practices

1. **Use .dockerignore** - Exclude node_modules, .git, logs
2. **Pin image versions** - Use `node:20.11-alpine` not `node:latest`
3. **Separate concerns** - One service per container
4. **Health checks** - Ensure services are ready before dependent ones start
5. **Graceful shutdown** - Handle SIGTERM properly
6. **Non-root user** - Run containers as unprivileged user
7. **Volume caching** - Use named volumes for dependencies

## Integration with OpenClaw

### Agent-Friendly Commands

```bash
# Check environment status
openclaw docker-dev status

# Quick environment switch
openclaw docker-dev use python
openclaw docker-dev use nodejs

# Run tests across environments
openclaw docker-dev test --env python --env nodejs
```

### One-Click Workflows

```yaml
# .openclaw/workflows/dev-setup.yml
workflow:
  name: "Setup Development Environment"
  steps:
    - detect: project_type
    - copy: docker-compose.{project_type}.yml
    - run: docker-compose up -d
    - wait_for: healthy
    - notify: "Environment ready at http://localhost:3000"
```
