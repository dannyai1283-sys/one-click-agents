#!/bin/bash
# Code Review Automation Setup
# Sets up PR templates and review automation

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

setup_github_templates() {
    log_info "Creating GitHub templates..."
    
    mkdir -p .github
    
    # PR template
    cat > .github/pull_request_template.md << 'EOF'
## Description
Brief description of the changes

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Testing
- [ ] Unit tests added/updated
- [ ] Manual testing performed
- [ ] All existing tests pass

## Checklist
- [ ] My code follows the project's style guidelines
- [ ] I have performed a self-review of my code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
EOF
    
    # Issue templates
    mkdir -p .github/ISSUE_TEMPLATE
    
    cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
A clear description of what you expected to happen.

**Screenshots**
If applicable, add screenshots.
EOF
    
    cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOF'
---
name: Feature request
about: Suggest an idea for this project
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

**Is your feature request related to a problem?**
A clear description of what the problem is.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
A clear description of any alternative solutions or features.
EOF
    
    log_success "GitHub templates created"
}

setup_codeowners() {
    log_info "Creating CODEOWNERS file..."
    
    cat > .github/CODEOWNERS << 'EOF'
# Global fallback
* @team-lead

# Frontend code
/src/components/ @frontend-team
/src/styles/ @frontend-team
/public/ @frontend-team

# Backend code
/src/api/ @backend-team
/src/models/ @backend-team
/src/database/ @backend-team

# DevOps/Infrastructure
/.github/ @devops-team
/terraform/ @devops-team
/docker/ @devops-team

# Documentation
/docs/ @docs-team
*.md @docs-team
EOF
    
    log_success "CODEOWNERS created"
}

create_review_script() {
    log_info "Creating review helper script..."
    
    cat > review.sh << 'EOF'
#!/bin/bash
# Code review helper

set -e

usage() {
    echo "Usage: $0 {check|lint|size|help}"
}

check_pr() {
    echo "🔍 Checking PR readiness..."
    
    # Check for console.log
    if grep -r "console.log" --include="*.js" --include="*.ts" src/ 2>/dev/null; then
        echo "⚠️  Found console.log statements"
    fi
    
    # Check for TODO without issue
    if grep -r "TODO\|FIXME" --include="*.js" --include="*.ts" src/ 2>/dev/null | grep -v "TODO(#" ; then
        echo "⚠️  TODOs without issue references"
    fi
    
    echo "✅ Basic checks complete"
}

check_size() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Not a git repository"
        exit 1
    fi
    
    # Count changed files and lines
    files=$(git diff --name-only origin/main...HEAD 2>/dev/null | wc -l)
    lines=$(git diff --stat origin/main...HEAD 2>/dev/null | tail -1 | awk '{print $4}' || echo "0")
    
    echo "📊 PR Statistics:"
    echo "  Files changed: $files"
    echo "  Lines changed: $lines"
    
    if [ "$lines" -gt 500 ]; then
        echo "⚠️  Large PR - consider breaking it down"
    elif [ "$lines" -gt 300 ]; then
        echo "📏 Medium-sized PR"
    else
        echo "✅ Small, focused PR"
    fi
}

run_lint() {
    echo "🔧 Running linters..."
    
    if [ -f "package.json" ]; then
        npm run lint 2>/dev/null || echo "No lint script found"
    elif [ -f "Makefile" ]; then
        make lint 2>/dev/null || echo "No lint target found"
    else
        echo "No lint configuration found"
    fi
}

case "${1:-}" in
    check)
        check_pr
        ;;
    size)
        check_size
        ;;
    lint)
        run_lint
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
    chmod +x review.sh
    
    log_success "Review script created"
}

main() {
    echo "========================================"
    echo "  Code Review Automation Setup"
    echo "========================================"
    echo ""
    
    setup_github_templates
    setup_codeowners
    create_review_script
    
    echo ""
    log_success "Code review automation configured! 👀"
    echo ""
    echo "Files created:"
    echo "  .github/pull_request_template.md"
    echo "  .github/ISSUE_TEMPLATE/"
    echo "  .github/CODEOWNERS"
    echo "  review.sh"
    echo ""
    echo "Next steps:"
    echo "  1. Customize templates for your project"
    echo "  2. Update CODEOWNERS with actual usernames/teams"
    echo "  3. Run './review.sh check' before submitting PRs"
    echo "  4. Commit and push to enable GitHub features"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/code-review-automation/setup.sh
