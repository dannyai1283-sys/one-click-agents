#!/bin/bash
# Git Workflow Automation Setup
# One-click setup for advanced git automation

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

check_requirements() {
    log_info "Checking requirements..."
    
    if ! command -v git &> /dev/null; then
        log_error "Git is not installed"
        exit 1
    fi
    
    if ! command -v gh &> /dev/null; then
        log_warn "GitHub CLI (gh) not found. Some features will be limited."
        echo "Install: https://cli.github.com/"
    fi
    
    log_success "Requirements met"
}

setup_gitconfig() {
    log_info "Setting up git configuration..."
    
    # Configure useful defaults
    git config --global init.defaultBranch main 2>/dev/null || true
    git config --global push.default current 2>/dev/null || true
    git config --global push.autoSetupRemote true 2>/dev/null || true
    git config --global pull.rebase true 2>/dev/null || true
    git config --global fetch.prune true 2>/dev/null || true
    git config --global rebase.autoStash true 2>/dev/null || true
    
    log_success "Git configuration updated"
}

setup_templates() {
    log_info "Setting up templates..."
    
    # Create .github directory
    mkdir -p .github
    
    # PR template
    cat > .github/pull_request_template.md << 'EOF'
## Description
<!-- Describe your changes -->

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Code refactoring

## Related Issues
<!-- Link related issues -->
Fixes #(issue number)

## Testing
<!-- Describe how you tested your changes -->
- [ ] Unit tests added/updated
- [ ] Integration tests passed
- [ ] Manual testing performed

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
EOF
    
    # Commit message template
    cat > .github/commit_template.txt << 'EOF'
# Type: feat|fix|docs|style|refactor|test|chore|perf|ci|build
# Subject: 50 chars or less
#
# Body: Explain what and why (not how)
# - Use bullet points
# - Wrap at 72 chars
#
# Breaking Changes:
# BREAKING CHANGE: description
EOF
    
    log_success "Templates created"
}

setup_hooks() {
    log_info "Setting up git hooks..."
    
    mkdir -p .git/hooks
    
    # Pre-commit hook
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pre-commit hook for quality checks

echo "Running pre-commit checks..."

# Check for trailing whitespace
if git diff --cached --check; then
    echo "✓ No trailing whitespace"
else
    echo "✗ Found trailing whitespace"
    exit 1
fi

# Check for large files
large_files=$(git diff --cached --numstat | awk '$1 > 1000 || $2 > 1000 {print $3}')
if [ -n "$large_files" ]; then
    echo "⚠ Large files detected:"
    echo "$large_files"
    echo "Consider using git LFS for large files"
fi

# Check for merge conflict markers
conflict_markers=$(git diff --cached --name-only | xargs grep -l "<<<<<<" 2>/dev/null || true)
if [ -n "$conflict_markers" ]; then
    echo "✗ Merge conflict markers found in:"
    echo "$conflict_markers"
    exit 1
fi

echo "✓ Pre-commit checks passed"
EOF
    chmod +x .git/hooks/pre-commit
    
    # Commit-msg hook for conventional commits
    cat > .git/hooks/commit-msg << 'EOF'
#!/bin/bash
# Commit message hook for conventional commits

commit_msg_file=$1
commit_msg=$(head -n1 "$commit_msg_file")

# Pattern for conventional commits
pattern="^(feat|fix|docs|style|refactor|test|chore|perf|ci|build)(\(.+\))?!?: .+"

if ! echo "$commit_msg" | grep -qE "$pattern"; then
    echo "⚠ Commit message does not follow conventional commits format"
    echo ""
    echo "Expected format: type(scope): subject"
    echo ""
    echo "Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build"
    echo ""
    echo "Example: feat(auth): add OAuth2 integration"
    echo ""
    # Don't fail, just warn
fi

echo "✓ Commit message check complete"
EOF
    chmod +x .git/hooks/commit-msg
    
    log_success "Git hooks installed"
}

setup_aliases() {
    log_info "Setting up git aliases..."
    
    # Useful aliases
    git config --global alias.st status
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.lg "log --oneline --graph --decorate --all"
    git config --global alias.lg10 "log --oneline --graph --decorate -10"
    git config --global alias.last "log -1 HEAD"
    git config --global alias.unstage "reset HEAD --"
    git config --global alias.undo "reset --soft HEAD~1"
    git config --global alias.visual "!gitk"
    
    log_success "Git aliases configured"
}

main() {
    echo "========================================"
    echo "  Git Workflow Setup"
    echo "========================================"
    echo ""
    
    check_requirements
    setup_gitconfig
    setup_templates
    setup_hooks
    setup_aliases
    
    echo ""
    log_success "Git workflow automation configured! 🌿"
    echo ""
    echo "Next steps:"
    echo "  - Start a feature: git checkout -b feature/my-feature"
    echo "  - Commit with style: git commit -m 'feat: add new feature'"
    echo "  - Create PR: gh pr create"
    echo ""
    echo "Useful aliases:"
    echo "  git st      → git status"
    echo "  git co      → git checkout"
    echo "  git lg      → pretty log with graph"
    echo "  git undo    → undo last commit (keep changes)"
}

main "$@"
