# MusicAI

MusicAI is an academic software project developed within the SENA **Análisis y Desarrollo de Software (ADSO)** program.

The project is focused on interactive learning of **Functional Harmony applied to Guitar**, combining structured musical education, interactive exercises, progress tracking, intelligent assistance, and future real-time musical analysis.

MusicAI is designed primarily as a mobile application for students who want to study harmony progressively from basic to advanced levels.

---

## Project Vision

MusicAI combines software engineering, music education, artificial intelligence, and digital signal processing to support autonomous guitar learning.

The intended learning experience follows a structured pedagogical path:

**Level → Lesson → Exercise**

Students study theoretical content, complete interactive exercises, receive feedback, track academic progress, and use the MusicAI Assistant for contextual support and personalized learning guidance.

The project is inspired by:

- structured functional-harmony learning applied to guitar;
- interactive practice experiences similar in concept to Rocksmith;
- precise musical-frequency analysis principles associated with professional tuning tools such as Peterson Strobe.

---

## Current Development Stage

MusicAI is transitioning from a **static HTML/CSS/JavaScript prototype** into the controlled implementation of the actual mobile application.

The repository currently contains:

- the approved functional requirements;
- the current transversal Functional Baseline;
- architecture documentation;
- UI/UX mockups;
- the existing navigable static prototype;
- repository-native agent governance;
- role definitions;
- the active Task Contract used to control each development lot.

The existing prototype remains available as a **visual and interaction reference**.

It is not the production application and must not be interpreted as the final implementation of the approved requirements.

The Flutter application has not yet been created in this repository at the current documented state.

Its placement and initial structure must be approved through the active architecture and Task Contract process before implementation begins.

---

## Functional Scope

The approved MVP functional scope is closed at:

**R01–R40**

The canonical detailed functional source is:

`00_Documentation/requirements/user-stories-v2.xlsx`

Transversal UX, navigation, scope, invariants, governance boundaries, and revoked historical decisions are defined in:

`00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`

Functionality must not be added by inference.

Prototype behavior, mockups, architecture documents, or historical artifacts do not independently create new requirements.

---

## Target Architecture

The approved target architecture is modular and primarily mobile-oriented.

### Mobile Frontend

- Flutter
- Dart
- Android as the primary mobile target
- Figma for UI/UX design

### Backend

- Python
- FastAPI
- JWT authentication

### Database

- SQL Server

### Artificial Intelligence

Depending on the implementation needs:

- Python
- NLP
- TensorFlow
- PyTorch
- OpenAI API or other explicitly approved integrations

### Musical Processing

- Python
- Librosa
- NumPy
- SciPy
- Digital Signal Processing (DSP)

### Infrastructure

- Docker
- Linux
- REST APIs
- GitHub
- possible cloud deployment

These technologies describe the **approved architectural direction**.

Their presence in the architecture documentation does not imply that they are already implemented in the repository.

---

## Architecture and Design Patterns

The current architecture documentation defines the following principal patterns:

- MVC
- Singleton
- Factory Method
- Observer
- Strategy
- Facade

Patterns are architectural tools, not implementation requirements by themselves.

A pattern should be applied only when it is justified by the responsibility and scope of the implementation being developed.

Current architecture sources:

```text
00_Documentation/architecture/
├── arquitectura-patrones-v1.pdf
├── diagrama-componentes_v1.png
└── diagrama-despliegue-v1.png
```

---

## Repository Structure

```text
MusicAI/
├── .github/
│   └── copilot-instructions.md
│
├── .vscode/
│
├── 00_Documentation/
│   ├── architecture/
│   │   ├── arquitectura-patrones-v1.pdf
│   │   ├── diagrama-componentes_v1.png
│   │   └── diagrama-despliegue-v1.png
│   │
│   ├── requirements/
│   │   ├── propuesta-tecnica-v1.pdf
│   │   ├── user-stories-v2.xlsx
│   │   └── MusicAI_Functional_Baseline_V3.2.md
│   │
│   ├── roles/
│   │   ├── atlas.md
│   │   ├── daedalus.md
│   │   ├── forge-fe.md
│   │   └── sentinel.md
│   │
│   ├── task-contract/
│   │   └── current.md
│   │
│   └── site-map/
│       └── site-map-v2.png
│
├── 01_Design/
│   └── mockups/
│       ├── 1p-login-.png
│       ├── 2p-home-ruta.png
│       ├── 3p-afinador.png
│       ├── fondo-tarjetas.png
│       ├── p4-lecciones.png
│       ├── p5-ejercicio-interactivo.png
│       ├── p6-resultado-ejercicio.png
│       └── p7-asistente.png
│
├── 02_Source/
│   ├── css/
│   ├── html/
│   ├── js/
│   ├── pages/
│   └── index.html
│
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── index.html
└── .gitignore
```

The repository structure must reflect the actual implementation state.

New implementation areas must not be created solely for organizational symmetry or anticipated future work.

---

## Static Prototype

The current implementation under `02_Source/` is a mobile-oriented static prototype built with:

- HTML5
- CSS3
- Vanilla JavaScript

It uses simulated local behavior and does not provide production persistence, authentication, backend processing, AI inference, or DSP.

The prototype currently contains representations of:

- Login
- Home
- Learning Path
- Interactive Exercise
- Exercise Result
- Progress Detail
- Challenges and Achievements
- Community
- Profile
- Tuner
- MusicAI Assistant Panel

Some prototype screens or interactions represent historical design states and may intentionally differ from the current R01–R40 functional baseline.

The prototype must therefore be treated as a **supporting implementation and visual reference**, not as the functional source of truth.

---

## Running the Static Prototype

The existing prototype can be served locally through an HTTP development server such as VS Code Live Server.

The repository contains VS Code workspace configuration for the prototype.

Do not open the prototype only through `file://` when testing functionality that loads HTML fragments dynamically.

For example, the Assistant Panel uses a relative `fetch()` operation and therefore requires an HTTP context.

The two existing `index.html` files act as entry or redirect points rather than primary application screens:

- root `index.html`
- `02_Source/index.html`

The implementation under `02_Source/` should remain isolated from the future Flutter application unless an approved architectural decision explicitly changes that responsibility.

---

## Design References

Current UI/UX references are stored under:

`01_Design/mockups/`

These mockups help preserve MusicAI's visual identity and approved interaction direction.

They are supporting design artifacts.

They do not override:

- canonical user stories;
- the Functional Baseline;
- approved architecture;
- the active Task Contract.

The current navigation map is located at:

`00_Documentation/site-map/site-map-v2.png`

The site map is an auxiliary navigation artifact and must not be treated as a functional source when it conflicts with current canonical documentation.

---

## Repository Governance

MusicAI uses repository-native governance designed to keep requirements, architecture, implementation, validation, and agent instructions separated.

### Neutral agent entry point

`AGENTS.md`

Defines the common repository guardrails and the progressive-disclosure workflow used by agents.

### Permanent roles

```text
00_Documentation/roles/
├── atlas.md
├── daedalus.md
├── forge-fe.md
└── sentinel.md
```

Current roles:

- **Atlas** — requirements engineering, functional governance, scope, and traceability.
- **Daedalus** — software architecture and significant technical design.
- **ForgeFE** — authorized frontend implementation.
- **Sentinel** — independent validation, compliance, and regression review.

Roles are added only when a real project need justifies them.

### Active Task Contract

`00_Documentation/task-contract/current.md`

Only one Task Contract is operational at a time.

The active contract defines the authorized objective, scope, files, validation, stop conditions, and completion criteria for the current work lot.

When a new lot begins, `current.md` is replaced. Git history preserves previous contracts for traceability.

### Tool-specific adapters

`CLAUDE.md` and `.github/copilot-instructions.md` are lightweight adapters.

They point their respective tools toward the neutral governance model instead of duplicating requirements, roles, architecture, or Task Contract instructions.

---

## Source Responsibilities

MusicAI intentionally separates documentation responsibilities.

| Source                                | Responsibility                                                      |
| ------------------------------------- | ------------------------------------------------------------------- |
| Repository + exact commit             | Current technical reality                                           |
| `user-stories-v2.xlsx`                | Detailed canonical functional requirements R01–R40                  |
| `MusicAI_Functional_Baseline_V3.2.md` | Transversal UX, navigation, scope, invariants and revoked decisions |
| Architecture artifacts                | Technical direction and structural design                           |
| `task-contract/current.md`            | Current operational authorization                                   |
| Mockups / prototype / site map        | Supporting design and implementation references                     |
| `AGENTS.md`                           | Common agent governance                                             |
| `roles/*.md`                          | Permanent agent responsibilities                                    |
| `README.md`                           | Human-facing project overview                                       |

No artifact should become a competing source for information owned by another artifact.

---

## Development Principles

MusicAI follows these engineering principles:

- Human-in-the-loop development.
- Requirements before implementation.
- Architecture proportional to the current need.
- No functionality added by inference.
- No speculative abstractions.
- No unnecessary dependencies.
- Small and reviewable implementation lots.
- Explicit separation between functional requirements and technical design.
- Explicit separation between prototype behavior and production behavior.
- Progressive disclosure of project context.
- Traceability from requirement to implementation and validation.
- Git history as the historical record of completed work.
- Repository state as the technical truth of what actually exists.

Juan Carlos remains the final human approver and controls repository state-changing Git operations.

---

## Development Workflow

The general project workflow is:

```text
Need / approved requirement
        ↓
Functional analysis
        ↓
Architecture or technical design when required
        ↓
Active Task Contract
        ↓
Controlled implementation
        ↓
Validation and regression review
        ↓
Human review
        ↓
Commit / Pull Request / integration
```

Implementation must remain inside the active Task Contract.

A new task must not silently expand the scope of a previous one.

---

## Current Transition to Flutter

The existing HTML/CSS/JavaScript prototype will not be overwritten or mixed indiscriminately with the production mobile implementation.

Before the Flutter application is created:

1. the real repository structure must be considered;
2. the application location must be proposed by the architecture role;
3. functional constraints must be reviewed;
4. an implementation Task Contract must authorize the new structure;
5. the prototype must remain preserved unless a future approved task explicitly changes its status.

This allows MusicAI to evolve from prototype to implementation without losing traceability or creating competing functional sources.

---

## Academic Context

MusicAI is developed as part of the SENA ADSO training process.

The repository supports academic evidence related to:

- requirements engineering;
- software architecture;
- UML;
- databases;
- frontend and mobile development;
- backend development;
- APIs;
- artificial intelligence;
- software quality;
- research;
- project documentation.

Technical decisions should therefore remain not only functional, but also understandable, traceable, justified, and defensible in an academic software engineering context.

---

## Status

**Functional scope:** R01–R40 defined
**Functional source:** `user-stories-v2.xlsx`
**Transversal baseline:** `MusicAI_Functional_Baseline_V3.2.md`
**Architecture:** defined at project level
**Static prototype:** available under `02_Source/`
**Mobile production implementation:** preparation phase
**Backend implementation:** not started
**Database integration:** not started
**Real AI integration:** not started
**Real DSP integration:** not started
**Repository-native governance:** established

MusicAI is currently moving from validated prototype and design work into controlled implementation while preserving requirements traceability, architectural consistency, and human oversight.
