# MusicAI — GitHub Copilot Adapter

## Purpose

This file is the GitHub Copilot-specific entry point for MusicAI.

It does not define product requirements, architecture, role responsibilities, implementation scope, or repository workflow.

The neutral repository governance is defined in:

`AGENTS.md`

---

## Copilot Workflow

Before performing any task:

1. Follow the repository governance defined in `AGENTS.md`.
2. Identify the role assigned to the current task.
3. Read only the corresponding role definition under:
   `00_Documentation/roles/`
4. Read the active Task Contract:
   `00_Documentation/task-contract/current.md`
5. Load only the canonical and supporting sources required by that contract.
6. Inspect the relevant current repository state before proposing or applying changes.
7. Stop if requirements, architecture, role ownership, repository state, or authorization are insufficient or contradictory.

Do not load unrelated project documentation by default.

---

## Responsibility Boundaries

GitHub Copilot must not use this file as an alternative source of truth.

Use:

- `AGENTS.md` for common repository governance;
- `00_Documentation/roles/*.md` for permanent role responsibilities;
- `00_Documentation/task-contract/current.md` for the currently authorized work;
- `00_Documentation/requirements/user-stories-v2.xlsx` for canonical detailed functional requirements;
- `00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md` for transversal functional and UX rules;
- approved architecture artifacts for architectural direction;
- the repository and exact commit for current technical reality.

Historical artifacts, prototypes, mockups, and auxiliary documentation must be used only according to the authority assigned to them by the current governance.

---

## Copilot-Specific Guardrails

- Do not infer missing requirements.
- Do not expand task scope.
- Do not redefine architecture.
- Do not modify files outside the active Task Contract.
- Do not create additional files merely for implementation convenience.
- Do not introduce dependencies, tools, frameworks, or integrations without authorization.
- Do not treat target architecture as already implemented.
- Do not treat current implementation as automatically functionally correct.
- Do not silently resolve contradictions between authoritative sources.
- Do not perform Git state-changing operations reserved for Juan Carlos.
- Do not duplicate canonical requirements, role definitions, or Task Contract instructions in this file.
- Do not perform speculative refactoring or unrelated cleanup.
- Preserve unrelated working behavior.

When additional context is required, load it progressively rather than expanding this file.

---

## Implementation Discipline

When implementation is authorized:

1. inspect before editing;
2. identify the exact authorized files;
3. understand the existing implementation;
4. make the smallest change that satisfies the active Task Contract;
5. preserve unrelated behavior;
6. run the required validation;
7. report unexpected findings instead of silently expanding the task.

If an additional file, dependency, architectural decision, or functional interpretation becomes necessary:

**stop → report the need → continue only after approval.**

---

## Review Discipline

When asked to review rather than implement:

- inspect the actual repository state;
- identify defects, inconsistencies, regressions, scope violations, and risks;
- distinguish verified findings from assumptions;
- do not silently modify the implementation;
- route functional issues to Atlas;
- route architectural issues to Daedalus;
- leave independent validation conclusions to Sentinel when Sentinel is assigned.

---

## Stop Rule

If the assigned role, active Task Contract, required source authority, or authorized scope cannot be determined safely:

**stop → report the exact gap → continue only after the appropriate owner resolves it.**
