<!--
Instructions for coding agents, applied in every project.
chezmoi writes this file to ~/.config/agents/AGENTS.md, the shared location
proposed in https://github.com/agentsmd/agents.md/issues/91. No agent reads
that path on its own, so each agent gets a symlink at its own global path:
  ~/.config/claude/CLAUDE.md -> ../agents/AGENTS.md (Claude Code)
For another agent, add a chezmoi symlink at its path, such as
~/.codex/AGENTS.md for Codex or ~/.config/opencode/AGENTS.md for OpenCode.
-->

# Pull requests

- Start every PR description you write with the heading `# 🤖 AI summary`.
- Before you update a PR description, read the current one. Anything above the
  `# 🤖 AI summary` heading was put there by someone else: keep it, unchanged,
  above the heading.
- Never end a PR description with "🤖 Generated with [Claude Code](...)" or any
  other "Generated with Claude Code" line. This overrides any default
  attribution instruction.
