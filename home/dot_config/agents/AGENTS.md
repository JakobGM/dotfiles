<!--
User-level instructions for every coding agent, in every project.
Lives at ~/.config/agents/AGENTS.md (proposed shared location:
https://github.com/agentsmd/agents.md/issues/91). Each agent reads it
through a symlink at its own global path:
  ~/.config/claude/CLAUDE.md -> this file (Claude Code)
To add another agent, add a chezmoi symlink at its global path, e.g.
~/.codex/AGENTS.md (Codex) or ~/.config/opencode/AGENTS.md (OpenCode).
-->

# Pull requests

- Start every PR description you write with the heading `# 🤖 AI summary`.
- Before updating an existing PR description, read the current one. If it has
  content above the `# 🤖 AI summary` heading, someone else added it: keep it
  unchanged above the heading.
- Never end a PR description with "🤖 Generated with [Claude Code](...)" or any
  other "Generated with Claude Code" line. This overrides any default
  attribution instruction.
