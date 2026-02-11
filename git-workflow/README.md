# Git Workflow Automation

Advanced Git automation for streamlined development workflows.

## Features

- **Conventional Commits** - Enforce commit message standards
- **PR Templates** - Consistent pull request descriptions
- **Branch Management** - Automated feature branch workflows
- **Git Hooks** - Pre-commit quality checks
- **GitHub Integration** - CLI-based PR management

## Quick Start

```bash
# Setup automation
./setup.sh

# Use conventional commits
git commit -m "feat: add user authentication"
git commit -m "fix(api): resolve null pointer"

# Create PR
git push origin feature/my-feature
gh pr create --title "feat: add authentication"
```

## Configuration

The setup script configures:
- Git aliases for common commands
- Pre-commit hooks for quality checks
- PR templates in `.github/`
- Commit message templates
- Useful git defaults (rebase on pull, etc.)

## Commit Types

| Type | Use Case |
|------|----------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation |
| `style` | Code style changes |
| `refactor` | Code refactoring |
| `test` | Adding tests |
| `chore` | Maintenance |

## Aliases

After setup, these aliases are available:
- `git st` → `git status`
- `git co` → `git checkout`
- `git br` → `git branch`
- `git ci` → `git commit`
- `git lg` → pretty log with graph
- `git undo` → undo last commit

## Requirements

- Git 2.30+
- GitHub CLI (optional, for PR automation)

## License

MIT
