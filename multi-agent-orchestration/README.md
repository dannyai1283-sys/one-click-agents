# Multi-Agent Orchestration

Coordinate multiple AI agents for complex task execution.

## Overview

This template provides infrastructure for running multiple specialized agents that can:
- Work in parallel on independent subtasks
- Communicate and share state
- Execute complex workflows (sequential, parallel, consensus)
- Self-heal and retry failed operations

## Architecture

```
Orchestrator
    ├── Task Distributor
    ├── Message Bus
    ├── Shared State
    └── Health Monitor
         │
    ┌────┼────┐
    │    │    │
Agent1 Agent2 Agent3
```

## Quick Start

```bash
# Setup
./setup.sh

# Start orchestrator
./orchestrator.sh start

# Check agent status
./orchestrator.sh status
```

## Included Agent Types

- **ResearchAgent** - Information gathering and analysis
- **CodeAgent** - Code generation and refactoring
- **ReviewAgent** - Code review and quality checks

## Workflows

- **Sequential Pipeline** - Pass output from one agent to the next
- **Parallel Map-Reduce** - Execute in parallel, aggregate results
- **Consensus** - Multiple agents vote on decisions

## Requirements

- Python 3.9+
- Docker (optional, for containerized agents)
- 2GB+ RAM

## Customization

Add new agents by extending `BaseAgent`:

```python
from agents.base import BaseAgent, Task, Result

class MyAgent(BaseAgent):
    async def execute(self, task: Task) -> Result:
        # Your logic here
        return Result(task_id=task.id, data="result")
```

## License

MIT
