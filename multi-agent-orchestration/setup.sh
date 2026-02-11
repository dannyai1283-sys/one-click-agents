#!/bin/bash
# Multi-Agent Orchestration Setup
# Sets up agent swarm coordination environment

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
    
    if ! command -v python3 &> /dev/null; then
        log_error "Python 3 is required"
        exit 1
    fi
    
    if ! command -v docker &> /dev/null; then
        log_warn "Docker not found. Containerized agents won't be available."
    fi
    
    log_success "Requirements checked"
}

setup_python_env() {
    log_info "Setting up Python environment..."
    
    python3 -m venv venv
    source venv/bin/activate
    
    pip install -q asyncio aiohttp pydantic pyyaml
    
    log_success "Python environment configured"
}

create_agent_structure() {
    log_info "Creating agent structure..."
    
    mkdir -p agents orchestrator communication workflows monitoring
    
    # Base agent class
    cat > agents/base.py << 'EOF'
"""Base agent class for multi-agent orchestration"""
from abc import ABC, abstractmethod
from typing import Any, Dict, List
from dataclasses import dataclass

@dataclass
class Task:
    id: str
    type: str
    data: Any
    required_capabilities: List[str] = None
    priority: int = 1

@dataclass
class Result:
    task_id: str
    data: Any
    success: bool = True
    error: str = None
    metadata: Dict = None

class BaseAgent(ABC):
    """Base class for all agents"""
    
    def __init__(self, name: str, capabilities: List[str]):
        self.name = name
        self.capabilities = capabilities
        self.pending_tasks = 0
        self.max_concurrent = 5
    
    @abstractmethod
    async def execute(self, task: Task) -> Result:
        """Execute a task and return result"""
        pass
    
    async def ping(self) -> bool:
        """Health check"""
        return True
EOF
    
    # Example agents
    cat > agents/research_agent.py << 'EOF'
"""Research agent implementation"""
from agents.base import BaseAgent, Task, Result
import asyncio

class ResearchAgent(BaseAgent):
    """Agent specialized in research tasks"""
    
    def __init__(self):
        super().__init__(
            name="researcher",
            capabilities=["web_search", "summarization", "analysis"]
        )
    
    async def execute(self, task: Task) -> Result:
        self.pending_tasks += 1
        try:
            # Simulate research
            await asyncio.sleep(1)
            return Result(
                task_id=task.id,
                data=f"Research results for: {task.data}",
                success=True
            )
        finally:
            self.pending_tasks -= 1
EOF
    
    cat > agents/code_agent.py << 'EOF'
"""Code agent implementation"""
from agents.base import BaseAgent, Task, Result
import asyncio

class CodeAgent(BaseAgent):
    """Agent specialized in code generation"""
    
    def __init__(self):
        super().__init__(
            name="coder",
            capabilities=["code_generation", "refactoring", "debugging"]
        )
    
    async def execute(self, task: Task) -> Result:
        self.pending_tasks += 1
        try:
            # Simulate coding
            await asyncio.sleep(2)
            return Result(
                task_id=task.id,
                data=f"Generated code for: {task.data}",
                success=True
            )
        finally:
            self.pending_tasks -= 1
EOF
    
    log_success "Agent structure created"
}

create_orchestrator() {
    log_info "Creating orchestrator..."
    
    cat > orchestrator/main.py << 'EOF'
"""Main orchestration server"""
import asyncio
import json
from typing import Dict, List
from agents.base import Task, Result
from agents.research_agent import ResearchAgent
from agents.code_agent import CodeAgent

class Orchestrator:
    """Coordinates multiple agents"""
    
    def __init__(self):
        self.agents: Dict[str, BaseAgent] = {}
        self.tasks: Dict[str, Task] = {}
        self.results: Dict[str, Result] = {}
    
    def register_agent(self, agent: BaseAgent):
        self.agents[agent.name] = agent
    
    def find_agent_for_task(self, task: Task) -> BaseAgent:
        """Find best agent for task based on capabilities"""
        candidates = []
        for agent in self.agents.values():
            if all(cap in agent.capabilities for cap in task.required_capabilities):
                load = agent.pending_tasks / agent.max_concurrent
                candidates.append((agent, load))
        
        if not candidates:
            raise ValueError(f"No agent found for task: {task}")
        
        return min(candidates, key=lambda x: x[1])[0]
    
    async def submit_task(self, task: Task) -> str:
        """Submit a task to appropriate agent"""
        agent = self.find_agent_for_task(task)
        self.tasks[task.id] = task
        
        # Execute asynchronously
        asyncio.create_task(self._execute_task(agent, task))
        
        return task.id
    
    async def _execute_task(self, agent: BaseAgent, task: Task):
        """Execute task and store result"""
        try:
            result = await agent.execute(task)
        except Exception as e:
            result = Result(
                task_id=task.id,
                data=None,
                success=False,
                error=str(e)
            )
        self.results[task.id] = result
    
    def get_result(self, task_id: str) -> Result:
        return self.results.get(task_id)
    
    def get_status(self) -> Dict:
        return {
            name: {
                "capabilities": agent.capabilities,
                "pending": agent.pending_tasks,
                "max": agent.max_concurrent
            }
            for name, agent in self.agents.items()
        }

# Global orchestrator instance
orchestrator = Orchestrator()
orchestrator.register_agent(ResearchAgent())
orchestrator.register_agent(CodeAgent())

async def main():
    print("Orchestrator started")
    print(f"Agents: {list(orchestrator.agents.keys())}")
    
    # Example: Submit a task
    task = Task(
        id="task-001",
        type="research",
        data="Python async patterns",
        required_capabilities=["web_search", "summarization"]
    )
    
    task_id = await orchestrator.submit_task(task)
    print(f"Submitted task: {task_id}")
    
    # Wait for result
    await asyncio.sleep(2)
    result = orchestrator.get_result(task_id)
    print(f"Result: {result}")

if __name__ == "__main__":
    asyncio.run(main())
EOF
    
    log_success "Orchestrator created"
}

create_cli() {
    log_info "Creating CLI tools..."
    
    cat > orchestrator.sh << 'EOF'
#!/bin/bash
# Orchestrator CLI

ORCHESTRATOR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ORCHESTRATOR_DIR/venv/bin/activate"

case "${1:-status}" in
    start)
        echo "Starting orchestrator..."
        python3 "$ORCHESTRATOR_DIR/orchestrator/main.py"
        ;;
    status)
        echo "Agent Status:"
        python3 -c "
import sys
sys.path.insert(0, '$ORCHESTRATOR_DIR')
from orchestrator.main import orchestrator
import json
print(json.dumps(orchestrator.get_status(), indent=2))
"
        ;;
    submit)
        if [ -z "${2:-}" ]; then
            echo "Usage: $0 submit 'task description'"
            exit 1
        fi
        echo "Submitting task: $2"
        ;;
    *)
        echo "Usage: $0 {start|status|submit}"
        exit 1
        ;;
esac
EOF
    chmod +x orchestrator.sh
    
    log_success "CLI tools created"
}

main() {
    echo "========================================"
    echo "  Multi-Agent Orchestration Setup"
    echo "========================================"
    echo ""
    
    check_requirements
    setup_python_env
    create_agent_structure
    create_orchestrator
    create_cli
    
    echo ""
    log_success "Multi-agent orchestration configured! 🐝"
    echo ""
    echo "Next steps:"
    echo "  - Start orchestrator: ./orchestrator.sh start"
    echo "  - Check status: ./orchestrator.sh status"
    echo "  - Submit task: ./orchestrator.sh submit 'task description'"
    echo ""
    echo "Customize agents in the agents/ directory"
}

main "$@"
EOF

chmod +x /Volumes/M2Sata/DannyAI/templates/openclaw-oneclick/multi-agent-orchestration/setup.sh
