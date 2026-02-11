# Code Review Automation

Automated code review assistance with templates and checks.

## Features

- **PR Templates** - Standardized pull request descriptions
- **Issue Templates** - Bug reports and feature requests
- **CODEOWNERS** - Automatic reviewer assignment
- **Review Scripts** - Pre-submission checks

## Quick Start

```bash
# Setup
./setup.sh

# Check PR before submitting
./review.sh check

# Check PR size
./review.sh size

# Run linters
./review.sh lint
```

## Templates Created

| File | Purpose |
|------|---------|
| `pull_request_template.md` | PR description template |
| `ISSUE_TEMPLATE/bug_report.md` | Bug report form |
| `ISSUE_TEMPLATE/feature_request.md` | Feature request form |
| `CODEOWNERS` | Auto-assign reviewers |

## Customization

Edit `.github/CODEOWNERS` to set up reviewer assignment:

```
# Example
/src/api/ @backend-team
/src/ui/ @frontend-team
/docs/ @tech-writers
```

## Requirements

- Git repository
- GitHub account (for templates)
- Bash shell

## License

MIT
