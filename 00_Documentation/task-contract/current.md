# MusicAI — Active Task Contract

**Contract ID:** DOC-GOV-BOOTSTRAP-002
**Status:** ACTIVE
**Project:** MusicAI
**Work Type:** Repository Governance Bootstrap and Documentation Alignment
**Final Human Authority:** Juan Carlos Carvajal
**Functional / Governance Reviewer:** Atlas
**Execution of Existing-File Alignment:** Juan Carlos — manual edits under Atlas review
**Architecture Consultation:** Daedalus — only if an architectural conflict is detected
**Independent Validation:** Sentinel — when final validation is requested
**Technical Baseline Commit:** `3f0771a42f449aeb9015d2816592d9830ecae0c6`

---

## 1. Purpose

This Task Contract establishes a repository-native, tool-agnostic governance model for MusicAI before beginning the Flutter implementation phase.

The purpose of this lot is to:

- create a neutral agent entry point;
- separate permanent role responsibilities from temporary task instructions;
- maintain only one active operational Task Contract;
- keep functional requirements separate from agent instructions;
- support progressive disclosure of project context;
- reduce duplicated governance across AI tools;
- preserve compatibility with Claude and GitHub Copilot through lightweight adapters;
- allow future tools such as OpenCode to use the same neutral governance without making MusicAI dependent on them;
- prepare the repository for controlled future implementation work.

This contract does **not** authorize product implementation.

---

## 2. Governance Principles

The following principles apply throughout this lot:

1. Do not invent requirements.
2. Do not invent architecture.
3. Do not infer product behavior from implementation convenience.
4. Do not duplicate canonical requirements into agent instruction files.
5. Separate permanent governance from temporary task instructions.
6. Keep tool-specific adapters minimal.
7. Prefer references to authoritative sources over duplicated content.
8. Use progressive disclosure to minimize unnecessary context.
9. Do not treat historical artifacts as current authority.
10. Do not install or adopt tools, frameworks, plugins, Skills, MCP integrations, agent runtimes, or dependencies during this lot.
11. Do not modify product code or UI/UX implementation.
12. Do not introduce new architectural decisions.
13. Do not modify functional requirements.
14. Juan Carlos remains the final approver.
15. Juan Carlos retains control over Git state-changing operations.
16. If a decision is missing or contradictory, stop and report it rather than resolving it silently.
17. Apply only the minimum governance structure justified by current project needs.
18. Do not create roles for work that is not currently needed.

---

## 3. Source-of-Truth Hierarchy

When information conflicts, use the following authority order.

### 1. Repository state and exact commit

The repository and exact commit establish the technical truth of what currently exists.

This does not automatically establish functional correctness.

### 2. Canonical functional requirements

`00_Documentation/requirements/user-stories-v2.xlsx`

This is the canonical detailed functional source for R01–R40.

### 3. Functional Baseline

`00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`

This is the canonical transversal source for:

- UX;
- navigation;
- scope;
- invariants;
- terminology;
- functional boundaries;
- revoked historical decisions.

### 4. Current architecture artifacts

Located under:

`00_Documentation/architecture/`

Including the current approved architecture documentation and diagrams.

Architecture defines technical direction.

Architecture does not prove that a capability is already implemented.

### 5. Active Task Contract

`00_Documentation/task-contract/current.md`

This file defines the operational scope and authorization for the current work lot.

The Task Contract cannot override higher-authority functional or architectural sources.

### 6. Supporting and historical artifacts

Examples include:

- prototype implementation;
- mockups;
- site map;
- coding strategy documents;
- previous documentation;
- historical design decisions.

These sources may support analysis but must not override canonical current sources.

---

## 4. Governance Model to Establish

The target repository governance model for this bootstrap is:

### Neutral entry point

`AGENTS.md`

Purpose:

- common repository guardrails;
- source hierarchy;
- role-selection flow;
- progressive disclosure;
- requirement to use the active Task Contract;
- general stop conditions;
- common Git restrictions.

It must remain tool-agnostic.

### Permanent role definitions

`00_Documentation/roles/`

Current canonical roles:

- `atlas.md`
- `daedalus.md`
- `forge-fe.md`
- `sentinel.md`

Role files define permanent responsibilities.

They must not contain temporary task instructions.

Additional roles are introduced only when real project work justifies them.

### Active Task Contract

`00_Documentation/task-contract/current.md`

Only one Task Contract is operational at a time.

It defines:

- objective;
- scope;
- authorized files;
- prohibited files;
- assigned responsibilities;
- required sources;
- acceptance criteria;
- validation;
- stop conditions;
- completion conditions.

When a new work lot begins, `current.md` is replaced.

Git history preserves previous contracts.

### Tool-specific adapters

- `CLAUDE.md`
- `.github/copilot-instructions.md`

These files must remain lightweight adapters.

They must point tools toward the neutral governance model and must not become competing sources of truth.

### Human-facing documentation

`README.md`

The README explains:

- project purpose;
- development state;
- architecture direction;
- repository structure;
- prototype status;
- governance structure.

It is not an agent contract and is not a replacement for functional requirements.

---

## 5. Starting Repository State

The verified repository baseline for this contract is:

**Branch:** `main`

**Commit:**

`3f0771a42f449aeb9015d2816592d9830ecae0c6`

At verification time:

- local `main` matched `origin/main`;
- the working tree was initially clean;
- the repository contained the historical HTML/CSS/JavaScript prototype;
- Flutter had not yet been created inside the repository;
- the Functional Baseline V3.2 was available externally and was intentionally placed into the repository during this bootstrap.

The file:

`00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`

is intentionally introduced as part of this governance alignment.

Its functional content is not authorized for reinterpretation or modification by this Task Contract.

---

## 6. Authorized New Files

This contract authorizes creation of:

- `AGENTS.md`
- `00_Documentation/roles/atlas.md`
- `00_Documentation/roles/daedalus.md`
- `00_Documentation/roles/forge-fe.md`
- `00_Documentation/roles/sentinel.md`
- `00_Documentation/task-contract/current.md`

It also authorizes inclusion of the already approved:

- `00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`

The Functional Baseline may be placed in its approved repository location.

Its content must not be modified as part of this bootstrap.

---

## 7. Authorized Existing-File Modifications

This contract authorizes controlled alignment of:

- `CLAUDE.md`
- `.github/copilot-instructions.md`
- `README.md`

These modifications are being performed manually by Juan Carlos under Atlas review.

The objective is not to rewrite product requirements.

The objective is to align these files with the new repository governance model.

---

## 8. Prohibited Areas

Unless required only for read-only inspection, this contract does not authorize modification of:

- `02_Source/`
- `01_Design/`
- `00_Documentation/architecture/`
- `00_Documentation/requirements/user-stories-v2.xlsx`
- `00_Documentation/requirements/propuesta-tecnica-v1.pdf`
- `00_Documentation/site-map/`
- root `index.html`
- `02_Source/index.html`
- `.vscode/`
- `.gitignore`

No product source code may be changed.

No UI implementation may be changed.

No architecture artifact may be changed.

No user story may be changed.

No site-map artifact may be changed.

---

## 9. Explicitly Out of Scope

This contract does not authorize:

- Flutter application creation;
- Dart source code;
- Android implementation;
- Home/Ruta implementation;
- backend implementation;
- FastAPI implementation;
- database implementation;
- SQL Server integration;
- authentication implementation;
- AI implementation;
- DSP implementation;
- API creation;
- production infrastructure;
- Docker configuration;
- deployment changes;
- prototype refactoring;
- HTML/CSS/JavaScript changes;
- UI redesign;
- requirement changes;
- architecture redesign;
- additional UML artifacts;
- new dependencies;
- new frameworks;
- `.opencode/`;
- OpenCode-specific configuration;
- agent runtimes;
- Skills;
- plugins;
- MCP integrations;
- DeepSeek Harness adoption;
- CI/CD automation;
- repository automation;
- additional permanent roles without demonstrated need.

In particular, **ForgeBE is not created during this bootstrap** because no backend implementation lot currently requires that role.

A backend role may be introduced later if actual backend work justifies it.

---

## 10. Role Allocation During This Lot

### Juan Carlos

Juan Carlos:

- is the final human authority;
- approves governance decisions;
- controls repository state;
- manually creates, places, and aligns governance documents when agreed;
- decides whether proposed changes are accepted;
- performs Git state-changing operations;
- determines when the bootstrap is ready to close.

### Atlas

Atlas:

- reviews governance structure;
- protects requirements and functional source authority;
- checks traceability and scope;
- identifies contradictions and omissions;
- reviews documentation alignment;
- helps define acceptance criteria;
- verifies that agent instructions do not become competing functional sources;
- reports unresolved issues to Juan Carlos.

Atlas does not redefine architecture.

### Daedalus

Daedalus is consulted only if this bootstrap exposes a genuine architectural question.

Daedalus may:

- evaluate repository placement implications;
- identify structural architectural conflicts;
- review future Flutter placement when the next Task Contract is prepared.

Daedalus does not redesign architecture during this bootstrap without separate authorization.

### ForgeFE

No implementation or documentation-editing task is currently assigned to ForgeFE during this bootstrap.

ForgeFE remains the canonical frontend implementation role and may be used only if a later explicitly approved task assigns work to it.

The existing-file alignment in this bootstrap is being performed manually by Juan Carlos under Atlas review.

ForgeFE must not reinterpret or redesign the governance model.

### Sentinel

Sentinel may perform the final independent validation of:

- contract compliance;
- file-scope compliance;
- cross-document consistency;
- acceptance criteria;
- unexpected regressions;
- completion readiness.

Sentinel does not modify implementation or redefine requirements.

---

## 11. Content Boundaries

### `AGENTS.md`

May contain:

- common guardrails;
- source hierarchy;
- role selection;
- progressive disclosure;
- active Task Contract requirement;
- general stop conditions;
- Git governance;
- general file discipline;
- general handoff rules.

It must not duplicate:

- detailed role definitions;
- detailed product requirements;
- detailed architecture;
- temporary task instructions.

### Role files

May contain:

- purpose;
- responsibilities;
- authority;
- boundaries;
- required inputs;
- expected outputs;
- working method;
- classification model;
- prohibited behavior;
- stop conditions;
- handoff behavior.

They must remain permanent and task-independent.

### `current.md`

May contain:

- current objective;
- scope;
- assigned responsibilities;
- authorized files;
- prohibited files;
- acceptance criteria;
- validation;
- stop conditions;
- completion conditions.

It is temporary operational governance.

### `CLAUDE.md`

Must function only as a Claude-specific adapter.

It must not duplicate the old monolithic repository guardrails.

### `.github/copilot-instructions.md`

Must function only as a GitHub Copilot-specific adapter.

It must not create a second governance model.

### `README.md`

Must remain human-facing.

It may explain the governance structure but must not become an agent execution contract.

### Functional Baseline

Must remain the transversal functional and UX authority.

It must not be modified merely to document the new agent governance model.

---

## 12. Progressive Disclosure Model

The default context-loading path is:

`AGENTS.md`

→ assigned role

→ `00_Documentation/task-contract/current.md`

→ required canonical sources

→ applicable architecture

→ relevant repository files

Agents must not load all project documentation by default.

Context should expand only when additional information materially affects the current task.

---

## 13. Git Governance

Juan Carlos retains control over Git state-changing operations.

During this contract, agents must not perform:

- `git add`
- `git commit`
- `git push`
- `git pull`
- branch creation
- branch switching
- merge
- rebase
- reset
- restore
- stash
- cherry-pick
- tag creation
- branch deletion
- history rewriting
- remote modification

Read-only Git inspection is allowed when necessary, including:

- `git status`
- `git diff`
- `git log`
- `git show`
- `git rev-parse`
- `git ls-tree`
- `git ls-files`

Juan Carlos decides when changes are staged, committed, or pushed.

---

## 14. Execution Sequence

The approved bootstrap sequence is:

### Step 1

Create:

`00_Documentation/task-contract/current.md`

### Step 2

Create:

`00_Documentation/roles/atlas.md`

### Step 3

Create:

`00_Documentation/roles/daedalus.md`

### Step 4

Create:

`00_Documentation/roles/forge-fe.md`

### Step 5

Create:

`00_Documentation/roles/sentinel.md`

### Step 6

Create:

`AGENTS.md`

### Step 7

Align:

`CLAUDE.md`

### Step 8

Align:

`.github/copilot-instructions.md`

### Step 9

Align:

`README.md`

### Step 10

Perform final cross-document validation:

- repository status;
- changed-file scope;
- whitespace validation;
- source references;
- role names;
- governance consistency;
- obsolete references;
- contradictions;
- final human review.

Only after successful validation may Juan Carlos decide to stage, commit, and push the bootstrap.

---

## 15. Acceptance Criteria

This Task Contract is satisfied only when all applicable criteria below are met.

### AC-01 — Neutral entry point

`AGENTS.md` exists at the repository root and acts as the neutral governance entry point.

### AC-02 — Tool independence

`AGENTS.md` does not depend on Claude, Copilot, OpenCode, DeepSeek Harness, or another agent runtime.

### AC-03 — Permanent roles separated

The following role definitions exist:

- Atlas
- Daedalus
- ForgeFE
- Sentinel

Their responsibilities are separated and task-independent.

### AC-04 — No unnecessary roles

No additional permanent role is created without a demonstrated current need.

### AC-05 — Single active Task Contract

`00_Documentation/task-contract/current.md` is the only active operational Task Contract.

### AC-06 — Task Contract remains temporary

Permanent role rules are not placed into `current.md` unnecessarily.

### AC-07 — Functional requirements remain separate

Detailed R01–R40 requirements are not duplicated into agent governance files.

### AC-08 — Functional Baseline available

`MusicAI_Functional_Baseline_V3.2.md` exists under the approved requirements directory.

### AC-09 — Functional Baseline preserved

Its functional content has not been altered by this bootstrap.

### AC-10 — Claude adapter minimized

`CLAUDE.md` acts as a lightweight adapter to the neutral governance model.

### AC-11 — Copilot adapter minimized

`.github/copilot-instructions.md` acts as a lightweight adapter to the neutral governance model.

### AC-12 — README aligned

`README.md` accurately describes:

- MusicAI;
- current development stage;
- target architecture;
- prototype status;
- repository structure;
- governance structure;
- transition toward Flutter.

It must not claim that unimplemented production capabilities already exist.

### AC-13 — Historical prototype not treated as canonical requirements

The README and agent governance clearly distinguish supporting prototype behavior from canonical functional sources.

### AC-14 — No product implementation changes

No files under `02_Source/` are modified.

### AC-15 — No architecture or design changes

No architecture or design artifact is modified.

### AC-16 — No unauthorized tooling

No framework, dependency, plugin, Skill, MCP integration, agent runtime, `.opencode` configuration, or automation is introduced.

### AC-17 — File scope clean

Only files authorized by this Task Contract are created or modified.

### AC-18 — Validation clean

Before closure:

- changed files are reviewed;
- unexpected files are absent;
- `git diff --check` reports no actual whitespace errors;
- cross-document references are coherent;
- role names are consistent;
- source authority is consistent;
- unresolved contradictions are reported.

Line-ending informational warnings caused by the local Windows Git configuration are not considered contract failures unless they result in unintended repository changes.

---

## 16. Validation Procedure

Before completion, perform read-only verification.

### Repository state

Review:

`git status`

or:

`git status --short`

Confirm that only authorized files appear.

### Existing tracked-file changes

Review:

`git diff -- CLAUDE.md .github/copilot-instructions.md README.md`

Confirm that:

- old monolithic governance is removed;
- requirements have not been accidentally redefined;
- architecture has not been redefined;
- README claims match current repository reality.

### Whitespace

Run:

`git diff --check`

The command must report no actual whitespace errors.

Informational LF/CRLF warnings caused by the local Windows configuration may be documented and left unchanged when they do not alter repository content unexpectedly.

### New-file inventory

Review:

`git ls-files --others --exclude-standard`

Expected new files are limited to:

- `AGENTS.md`
- `00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`
- `00_Documentation/roles/atlas.md`
- `00_Documentation/roles/daedalus.md`
- `00_Documentation/roles/forge-fe.md`
- `00_Documentation/roles/sentinel.md`
- `00_Documentation/task-contract/current.md`

### Cross-document review

Confirm:

- `AGENTS.md` points to the active roles and Task Contract;
- role names are consistent everywhere;
- `ForgeFE` is the canonical frontend role name;
- no obsolete or incorrect role naming remains;
- no unsupported role is presented as current;
- `CLAUDE.md` points to the neutral governance;
- Copilot instructions point to the neutral governance;
- README does not duplicate operational rules unnecessarily;
- source hierarchy is consistent;
- the site map and prototype are not elevated above canonical functional sources;
- current implementation is not confused with target architecture.

---

## 17. Stop Conditions

Stop this bootstrap and report the issue if:

- a functional requirement would need to change;
- architecture would need to be redesigned;
- a canonical source conflicts materially with the governance being created;
- a required file outside the authorized list would need modification;
- product source code would need modification;
- a new tool or dependency becomes necessary;
- another agent role must be created without clear current justification;
- repository state differs materially from the validated baseline in a way that affects scope;
- an unexpected unrelated modification is discovered;
- a governance decision cannot be resolved from approved sources;
- completion would require an unauthorized Git operation.

Do not resolve a stop condition through assumption.

---

## 18. Completion Conditions

This bootstrap may be considered ready for closure when:

1. all authorized governance files exist;
2. the Functional Baseline is correctly placed;
3. `AGENTS.md` is established;
4. the four current permanent role files are established;
5. `CLAUDE.md` is aligned;
6. `.github/copilot-instructions.md` is aligned;
7. `README.md` is aligned;
8. no product implementation has changed;
9. no unauthorized file has changed;
10. whitespace validation is clean;
11. cross-document consistency is verified;
12. unresolved findings are documented;
13. Juan Carlos performs final review.

Only Juan Carlos decides whether to stage, commit, and push the completed bootstrap.

---

## 19. Handoff After Completion

After this governance bootstrap is closed, this Task Contract must no longer govern implementation work.

Before Flutter Home/Ruta development begins, `current.md` must be replaced with a new implementation-specific Task Contract.

That future contract must define, at minimum:

- approved Flutter application location inside the repository;
- relevant functional requirements;
- Home/Ruta scope;
- authorized files;
- architecture constraints;
- Android target;
- simulation boundaries;
- acceptance criteria;
- required tests;
- validation procedure;
- stop conditions.

The future Flutter contract must be based on the repository state that exists after this bootstrap is committed and approved.

---

## 20. Final Contract Rule

This contract authorizes **documentation governance bootstrap only**.

If an action is not explicitly authorized by this contract, it is not authorized.

When uncertainty affects scope, requirements, architecture, file ownership, or repository state:

**stop → report → validate → obtain approval → continue.**
