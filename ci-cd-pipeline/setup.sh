#!/bin/bash
# CI/CD Pipeline Setup
# Sets up continuous integration and deployment configurations

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

detect_project_type() {
    if [ -f "package.json" ]; then
        echo "nodejs"
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        echo "python"
    elif [ -f "go.mod" ]; then
        echo "go"
    elif [ -f "Dockerfile" ]; then
        echo "docker"
    else
        echo "generic"
    fi
}

setup_github_actions() {
    log_info "Setting up GitHub Actions..."
    
    mkdir -p .github/workflows
    
    local project_type=$(detect_project_type)
    
    case "$project_type" in
        nodejs)
            cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [18.x, 20.x]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
          cache: 'npm'
      - run: npm ci
      - run: npm run lint
      - run: npm test
      - run: npm run build
EOF
            ;;
        python)
            cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: pytest
EOF
            ;;
        *)
            cat > .github/workflows/ci.yml << 'EOF'
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: echo "Add your build commands here"
      - name: Test
        run: echo "Add your test commands here"
EOF
            ;;
    esac
    
    # Docker build workflow
    cat > .github/workflows/docker.yml << 'EOF'
name: Docker Build

on:
  push:
    tags: ['v*']
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v4
      - uses: docker/setup-buildx-action@v3
      - uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/metadata-action@v5
        id: meta
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
      - uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
EOF
    
    log_success "GitHub Actions configured"
}

setup_gitlab_ci() {
    log_info "Setting up GitLab CI..."
    
    cat > .gitlab-ci.yml << 'EOF'
stages:
  - test
  - build
  - deploy

test:
  stage: test
  script:
    - echo "Run tests here"
  only:
    - merge_requests
    - main

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker build -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
  only:
    - main

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - main
EOF
    
    log_success "GitLab CI configured"
}

create_deploy_script() {
    log_info "Creating deployment script..."
    
    cat > deploy.sh << 'EOF'
#!/bin/bash
# Deployment script

set -e

ENVIRONMENT="${1:-staging}"
IMAGE_TAG="${2:-latest}"

echo "Deploying to $ENVIRONMENT..."
echo "Image tag: $IMAGE_TAG"

# Add your deployment commands here
# Example for Kubernetes:
# kubectl set image deployment/app app=myapp:$IMAGE_TAG -n $ENVIRONMENT
# kubectl rollout status deployment/app -n $ENVIRONMENT

echo "Deployment complete!"
EOF
    chmod +x deploy.sh
    
    log_success "Deployment script created"
}

main() {
    echo "========================================"
    echo "  CI/CD Pipeline Setup"
    echo "========================================"
    echo ""
    
    local platform="${1:-github}"
    
    case "$platform" in
        github|gha)
            setup_github_actions
            ;;
        gitlab)
            setup_gitlab_ci
            ;;
        *)
            log_warn "Unknown platform: $platform"
            echo "Supported: github, gitlab"
            exit 1
            ;;
    esac
    
    create_deploy_script
    
    echo ""
    log_success "CI/CD pipeline configured! 🚀"
    echo ""
    echo "Next steps:"
    echo "  1. Review the generated workflow files"
    echo "  2. Add required secrets to your repository"
    echo "  3. Customize for your specific deployment needs"
    echo "  4. Commit and push to trigger the pipeline"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/ci-cd-pipeline/setup.sh
