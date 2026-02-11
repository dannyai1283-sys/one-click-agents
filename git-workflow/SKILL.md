---
name: git-workflow
description: Advanced Git automation for OpenClaw. Automates PR creation, branch management, commit workflows, and collaborative development patterns. Includes conventional commits, PR templates, and CI integration.
homepage: https://git-scm.com/
metadata: {"clawdbot":{"emoji":"🌿","requires":{"bins":["git","gh"]},"os":["linux","darwin","win32"]}}
---

# Git Workflow Automation

Streamline your Git workflows with automated branch management, PR creation, and collaborative patterns. Perfect for teams and agents working together.

## When to Use

- Creating feature branches with consistent naming
- Automating PR creation with templates
- Managing conventional commits
- Syncing forks and upstream repositories
- Batch operations across multiple repos
- CI/CD pipeline integration

## Quick Start

```bash
# Setup git workflow automation
./setup.sh

# Create feature branch and PR
openclaw git feature add-user-auth
openclaw git pr --title "Add user authentication" --reviewers alice,bob

# Sync with upstream
openclaw git sync upstream

# Conventional commit
openclaw git commit "feat: add OAuth2 integration"
```

## Branch Management

### Feature Branch Workflow

```bash
# Create feature branch from main
openclaw git feature start <feature-name>
# Creates: feature/add-user-authentication

# List active features
openclaw git feature list

# Finish feature (merge to main, delete branch)
openclaw git feature finish
```

### Branch Naming Conventions

```bash
# Auto-formatted branch names
feature/add-user-authentication    # Features
bugfix/fix-login-redirect          # Bug fixes
hotfix/security-patch-2024         # Urgent fixes
release/v2.1.0                     # Releases
docs/api-documentation             # Documentation
refactor/user-service              # Refactoring
```

### Bulk Branch Operations

```bash
# Clean up merged branches
openclaw git cleanup

# List stale branches (older than 30 days)
openclaw git stale

# Archive old branches
openclaw git archive --older-than 90d
```

## Pull Request Automation

### Creating PRs

```bash
# Create PR with template
openclaw git pr create

# Quick PR with all options
openclaw git pr \
  --title "feat: implement user roles" \
  --body "Implements #123" \
  --reviewers alice,bob,carol \
  --labels "feature,security" \
  --draft

# PR from current branch to specific target
openclaw git pr --base develop --title "WIP: new feature"
```

### PR Templates

**`.github/pull_request_template.md`:**
```markdown
## Description
<!-- Describe your changes -->

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation

## Testing
<!-- How was this tested? -->

## Checklist
- [ ] Tests pass
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
```

### Review Management

```bash
# List open PRs
openclaw git pr list --author @me

# Check PR status
openclaw git pr status

# View PR diff
openclaw git pr diff <number>

# Approve PR
openclaw git pr approve <number>

# Merge when ready
openclaw git pr merge <number> --squash
```

## Conventional Commits

### Commit Message Format

```bash
# Format: type(scope): subject

openclaw git commit "feat(auth): add OAuth2 integration"
openclaw git commit "fix(api): resolve null pointer exception"
openclaw git commit "docs: update API documentation"
openclaw git commit "refactor(user): simplify user model"
openclaw git commit "test(auth): add OAuth2 tests"
openclaw git commit "chore(deps): update dependencies"
```

### Types Reference

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat: add user login` |
| `fix` | Bug fix | `fix: correct validation` |
| `docs` | Documentation | `docs: update README` |
| `style` | Code style | `style: fix indentation` |
| `refactor` | Refactoring | `refactor: extract method` |
| `test` | Tests | `test: add unit tests` |
| `chore` | Maintenance | `chore: update deps` |
| `perf` | Performance | `perf: optimize query` |
| `ci` | CI/CD | `ci: add GitHub Action` |
| `build` | Build system | `build: update webpack` |

### Breaking Changes

```bash
# Include breaking change indicator
openclaw git commit "feat(api)!: change response format"

# Or in description
openclaw git commit "feat: new feature

BREAKING CHANGE: drops support for Node 14"
```

## Repository Sync

### Fork Management

```bash
# Add upstream remote
openclaw git upstream add https://github.com/original/repo.git

# Sync fork with upstream
openclaw git sync upstream

# Force sync (⚠️ destructive)
openclaw git sync upstream --force
```

### Multi-Repository Operations

```bash
# Clone multiple repos
openclaw git clone-batch org/repo1 org/repo2 org/repo3

# Pull all repos in directory
openclaw git bulk pull

# Run command in all repos
openclaw git bulk exec "git status"

# Find repos needing attention
openclaw git bulk status
```

## Advanced Workflows

### Interactive Rebase Helper

```bash
# Clean up commits before PR
openclaw git rebase interactive

# Auto-squash fixups
openclaw git rebase --autosquash

# Rebase onto main
openclaw git rebase main
```

### Stash Management

```bash
# Stash with description
openclaw git stash "WIP: refactoring auth"

# List stashes
openclaw git stash list

# Apply and keep stash
openclaw git stash apply "WIP: refactoring auth"

# Apply and remove
openclaw git stash pop
```

### Cherry-Pick Workflow

```bash
# Cherry-pick commit from another branch
openclaw git cherry-pick abc123

# Cherry-pick range
openclaw git cherry-pick abc123..def456

# Cherry-pick from PR
openclaw git cherry-pick pr/123
```

## CI/CD Integration

### Pre-commit Hooks

```bash
# Setup hooks
openclaw git hooks setup

# Run pre-commit checks manually
openclaw git hooks run
```

**`.pre-commit-config.yaml`:**
```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
  
  - repo: local
    hooks:
      - id: conventional-commit
        name: Conventional Commit
        entry: scripts/check-commit-msg.sh
        language: script
        stages: [commit-msg]
```

### GitHub Actions Integration

```bash
# Check CI status
openclaw git ci status

# Wait for CI to pass
openclaw git ci wait --timeout 10m

# View failed jobs
openclaw git ci logs --failed
```

## Release Management

### Semantic Versioning

```bash
# Bump version
openclaw git version bump patch  # 1.0.0 → 1.0.1
openclaw git version bump minor  # 1.0.0 → 1.1.0
openclaw git version bump major  # 1.0.0 → 2.0.0

# Create release
openclaw git release create v1.2.0

# Generate changelog
openclaw git changelog --since v1.0.0
```

### Tagging

```bash
# Create annotated tag
openclaw git tag v1.2.0 "Release 1.2.0"

# Push tags
openclaw git tag push

# Delete tag
openclaw git tag delete v1.2.0
```

## Troubleshooting

### Recover from Mistakes

```bash
# Undo last commit (keep changes)
openclaw git undo --soft

# Undo last commit (discard changes)
openclaw git undo --hard

# Recover deleted branch
openclaw git recover <branch-name>

# Show reflog
openclaw git reflog
```

### Merge Conflicts

```bash
# Show conflict files
openclaw git conflicts

# Resolve with ours/theirs
openclaw git resolve --ours <file>
openclaw git resolve --theirs <file>

# Mark resolved
openclaw git resolved <file>

# Abort merge
openclaw git merge --abort
```

### Large File Handling

```bash
# Check for large files
openclaw git large-files

# Setup LFS
openclaw git lfs setup

# Track large files
openclaw git lfs track "*.psd"
```

## Configuration

### Global Git Config

```bash
# Setup recommended defaults
openclaw git config setup

# Configure user
openclaw git config user "Your Name" "email@example.com"

# Configure signing
openclaw git config signing --gpg-key ABC123
```

**`.gitconfig`:**
```ini
[init]
    defaultBranch = main
[push]
    default = current
    autoSetupRemote = true
[pull]
    rebase = true
[fetch]
    prune = true
[rebase]
    autoStash = true
[commit]
    template = ~/.gitmessage
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate
```

## Best Practices

1. **Branch per feature** - Keep changes isolated
2. **Small commits** - One logical change per commit
3. **Clear messages** - Explain why, not just what
4. **Regular sync** - Pull from main frequently
5. **Review before merge** - No direct pushes to main
6. **Squash on merge** - Keep history clean
7. **Tag releases** - Mark important milestones
8. **Protect main** - Require PR reviews

## Integration with OpenClaw

### Agent Workflows

```bash
# Agent creates feature branch
openclaw git feature start ai-refactor

# Agent commits changes
openclaw git commit "refactor: optimize database queries"

# Agent creates PR
openclaw git pr --title "refactor: database optimization"

# Agent checks CI status
openclaw git ci status
```

### Automation Rules

```yaml
# .openclaw/git-workflow.yml
workflow:
  on:
    feature_start:
      - create_branch
      - update_issue: "In Progress"
    
    pr_create:
      - fill_template
      - add_reviewers: ["senior-dev"]
      - label: ["needs-review"]
    
    pr_merge:
      - check_ci_passed
      - delete_branch
      - update_issue: "Done"
```
