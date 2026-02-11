# Docker Dev Environment Template

Quickly set up containerized development environments for any tech stack.

## What's Included

- **Pre-configured stacks** for Node.js, Python, Go, and full-stack development
- **Hot reload** configuration for rapid development
- **Database containers** (PostgreSQL, MongoDB, Redis)
- **Docker Compose** configurations for easy management
- **One-click setup scripts** for instant provisioning

## Installation

```bash
# Copy template to your project
cp -r docker-dev-environment/ ~/projects/my-app/
cd ~/projects/my-app

# Run setup
chmod +x setup.sh
./setup.sh
```

## Available Stacks

| Stack | Services | Use Case |
|-------|----------|----------|
| `nodejs` | Node 20 + MongoDB | Express, Next.js, API servers |
| `python` | Python 3.11 + PostgreSQL | FastAPI, Django, Flask |
| `go` | Go 1.21 + Redis | Microservices, APIs |
| `fullstack` | React + Node + PostgreSQL | Complete web apps |

## Quick Commands

```bash
# Start environment
./setup.sh nodejs

# Stop environment
docker-compose down

# View logs
docker-compose logs -f

# Run commands inside container
docker-compose exec app npm install

# Database shell
docker-compose exec postgres psql -U dev -d app
```

## Project Structure

```
docker-dev-environment/
├── SKILL.md                    # Agent skill documentation
├── README.md                   # This file
├── setup.sh                    # One-click setup script
├── docker-compose.nodejs.yml   # Node.js stack
├── docker-compose.python.yml   # Python stack
├── docker-compose.go.yml       # Go stack
├── examples/                   # Example projects
│   ├── nodejs-express/
│   ├── python-fastapi/
│   └── go-api/
└── .env.example               # Environment template
```

## Requirements

- Docker 24.0+
- Docker Compose 2.0+
- 4GB+ available RAM
- 10GB+ free disk space

## Next Steps

1. Choose your stack: `./setup.sh --list`
2. Customize `docker-compose.*.yml` for your needs
3. Copy `.env.example` to `.env` and configure
4. Start coding!

## License

MIT
