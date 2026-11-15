# MusicAI — Claude Code Adapter

@AGENTS.md

## Purpose

This file is the Claude-specific entry point for MusicAI.

Common repository governance is imported from `AGENTS.md`.

This file does not independently define product requirements, architecture, role responsibilities, implementation scope, or repository workflow.

---

## Claude Code Workflow

Before performing any task:

1. Follow the governance imported from `AGENTS.md`.
2. Identify the role assigned to the current task.
3. Read only the corresponding role definition under:
   `00_Documentation/roles/`
4. Read the active Task Contract:
   `00_Documentation/task-contract/current.md`
5. Load only the canonical and supporting sources required by that contract.
6. Inspect the relevant current repository state before proposing or applying changes.
7. Apply the authorization boundaries and stop conditions defined in `AGENTS.md` and the active Task Contract.

Do not load unrelated project documentation by default.

---

## Responsibility Boundaries

Claude must not use this file as an alternative source of truth.

The imported governance defines the authority of requirements, architecture, role definitions, Task Contracts, supporting artifacts, and repository state.

Do not duplicate those definitions or introduce independent rules in this adapter.

When additional context is required, load it progressively rather than expanding this file.

---

## Stop Rule

If the assigned role, active Task Contract, required source authority, or authorized scope cannot be determined safely:

**stop → report the exact gap → continue only after the appropriate owner resolves it.**
