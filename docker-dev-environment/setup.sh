#!/bin/bash
# Docker Dev Environment Setup Script
# One-click setup for containerized development environments

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_NAME="${PROJECT_NAME:-$(basename "$PWD")}"

# Functions
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

check_requirements() {
    log_info "Checking requirements..."
    
    if ! command -v docker &> /dev/null; then
        log_error "Docker is not installed. Please install Docker first."
        echo "  macOS: brew install --cask docker"
        echo "  Ubuntu: sudo apt-get install docker.io"
        exit 1
    fi
    
    if ! docker info &> /dev/null; then
        log_error "Docker daemon is not running. Please start Docker."
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        log_error "Docker Compose is not installed."
        exit 1
    fi
    
    log_success "All requirements met!"
}

list_stacks() {
    echo "Available stacks:"
    echo "  nodejs    - Node.js 20 + MongoDB"
    echo "  python    - Python 3.11 + PostgreSQL"
    echo "  go        - Go 1.21 + Redis"
    echo "  fullstack - React + Node + PostgreSQL"
    echo ""
    echo "Usage: ./setup.sh [stack-name]"
}

detect_stack() {
    log_info "Detecting project type..."
    
    if [ -f "package.json" ]; then
        log_info "Detected Node.js project"
        echo "nodejs"
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        log_info "Detected Python project"
        echo "python"
    elif [ -f "go.mod" ]; then
        log_info "Detected Go project"
        echo "go"
    else
        log_warn "Could not detect project type"
        echo ""
        list_stacks
        exit 1
    fi
}

setup_nodejs() {
    log_info "Setting up Node.js development environment..."
    
    cp "$TEMPLATE_DIR/docker-compose.nodejs.yml" docker-compose.yml
    
    # Create package.json if it doesn't exist
    if [ ! -f "package.json" ]; then
        cat > package.json << 'EOF'
{
  "name": "my-app",
  "version": "1.0.0",
  "scripts": {
    "dev": "nodemon --legacy-watch src/index.js",
    "start": "node src/index.js",
    "test": "jest"
  },
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "nodemon": "^3.0.0",
    "jest": "^29.0.0"
  }
}
EOF
        mkdir -p src
        cat > src/index.js << 'EOF'
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Hello from Docker!', timestamp: new Date() });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
EOF
    fi
    
    # Create .dockerignore
    cat > .dockerignore << 'EOF'
node_modules
npm-debug.log
.git
.env
*.md
.nyc_output
coverage
.vscode
.idea
EOF
    
    log_success "Node.js environment configured!"
}

setup_python() {
    log_info "Setting up Python development environment..."
    
    cp "$TEMPLATE_DIR/docker-compose.python.yml" docker-compose.yml
    
    # Create requirements.txt if it doesn't exist
    if [ ! -f "requirements.txt" ]; then
        cat > requirements.txt << 'EOF'
fastapi==0.104.0
uvicorn[standard]==0.24.0
pydantic==2.5.0
sqlalchemy==2.0.0
psycopg2-binary==2.9.9
alembic==1.12.0
pytest==7.4.0
httpx==0.25.0
EOF
        mkdir -p app
        cat > app/main.py << 'EOF'
from fastapi import FastAPI
from datetime import datetime

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello from Docker!", "timestamp": datetime.now()}

@app.get("/health")
async def health():
    return {"status": "healthy"}
EOF
    fi
    
    # Create .dockerignore
    cat > .dockerignore << 'EOF'
__pycache__
*.pyc
*.pyo
*.pyd
.Python
*.so
*.egg
*.egg-info
dist
build
.git
.env
venv
.venv
EOF
    
    log_success "Python environment configured!"
}

setup_go() {
    log_info "Setting up Go development environment..."
    
    cp "$TEMPLATE_DIR/docker-compose.go.yml" docker-compose.yml
    
    # Create go.mod if it doesn't exist
    if [ ! -f "go.mod" ]; then
        go mod init "my-app" 2>/dev/null || echo "module my-app" > go.mod
        
        cat > main.go << 'EOF'
package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"
)

type Response struct {
	Message   string    `json:"message"`
	Timestamp time.Time `json:"timestamp"`
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		resp := Response{
			Message:   "Hello from Docker!",
			Timestamp: time.Now(),
		}
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(resp)
	})

	fmt.Println("Server starting on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
EOF
        
        # Create air config for hot reload
        cat > .air.toml << 'EOF'
root = "."
testdata_dir = "testdata"
tmp_dir = "tmp"

[build]
args_bin = []
bin = "./tmp/main"
cmd = "go build -o ./tmp/main ."
delay = 1000
exclude_dir = ["assets", "tmp", "vendor"]
exclude_file = []
exclude_regex = ["_test.go"]
exclude_unchanged = false
follow_symlink = false
full_bin = ""
include_dir = []
include_ext = ["go", "tpl", "tmpl", "html"]
kill_delay = "0s"
log = "build-errors.log"
send_interrupt = false
stop_on_root = false

[color]
app = ""
build = "yellow"
main = "magenta"
runner = "green"
watcher = "cyan"

[log]
time = false

[misc
clean_on_exit = false

[screen]
clear_on_rebuild = false
EOF
    fi
    
    log_success "Go environment configured!"
}

setup_fullstack() {
    log_info "Setting up full-stack development environment..."
    
    cp "$TEMPLATE_DIR/docker-compose.fullstack.yml" docker-compose.yml 2>/dev/null || {
        log_warn "Fullstack compose file not found, creating..."
        cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  frontend:
    image: node:20-alpine
    working_dir: /app
    volumes:
      - ./frontend:/app
      - frontend_node_modules:/app/node_modules
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
      - REACT_APP_API_URL=http://localhost:8000
    command: npm start
    depends_on:
      - backend

  backend:
    image: node:20-alpine
    working_dir: /app
    volumes:
      - ./backend:/app
      - backend_node_modules:/app/node_modules
    ports:
      - "8000:8000"
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://dev:dev@postgres:5432/app
    command: npm run dev
    depends_on:
      - postgres

  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: dev
      POSTGRES_PASSWORD: dev
      POSTGRES_DB: app
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  frontend_node_modules:
  backend_node_modules:
  postgres_data:
EOF
    }
    
    # Create frontend structure
    mkdir -p frontend backend
    
    log_success "Fullstack environment configured!"
}

start_environment() {
    log_info "Starting development environment..."
    
    if [ ! -f ".env" ] && [ -f ".env.example" ]; then
        cp .env.example .env
        log_info "Created .env from template"
    fi
    
    docker-compose up -d
    
    log_success "Environment started!"
    echo ""
    echo "Services available at:"
    docker-compose ps
}

main() {
    echo "========================================"
    echo "  Docker Dev Environment Setup"
    echo "========================================"
    echo ""
    
    check_requirements
    
    local stack="${1:-}"
    
    if [ -z "$stack" ]; then
        stack=$(detect_stack)
    fi
    
    case "$stack" in
        nodejs|node|js)
            setup_nodejs
            ;;
        python|py)
            setup_python
            ;;
        go|golang)
            setup_go
            ;;
        fullstack|fs)
            setup_fullstack
            ;;
        --list|-l)
            list_stacks
            exit 0
            ;;
        *)
            log_error "Unknown stack: $stack"
            list_stacks
            exit 1
            ;;
    esac
    
    start_environment
    
    echo ""
    log_success "Setup complete! Happy coding! 🚀"
    echo ""
    echo "Next steps:"
    echo "  - View logs: docker-compose logs -f"
    echo "  - Stop: docker-compose down"
    echo "  - Shell: docker-compose exec app sh"
}

main "$@"
