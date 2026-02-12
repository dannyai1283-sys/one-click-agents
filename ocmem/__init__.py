"""
OpenClaw Memory System (OC-Mem)

A mem0-inspired memory layer for OpenClaw AI Agents.

Quick Start:
    from ocmem import OpenClawMemory
    
    mem = OpenClawMemory(user_id="danny", agent_id="main")
    
    # Add memory
    mem.add("I prefer working in the morning", category="preference")
    
    # Search
    results = mem.search("when do I work best?")
    
    # Get context
    context = mem.get_context(max_tokens=1000)
"""

__version__ = "0.1.0"
__author__ = "OpenClaw Team"

from .core.memory import OpenClawMemory
from .core.config import MemoryConfig

__all__ = ["OpenClawMemory", "MemoryConfig"]
