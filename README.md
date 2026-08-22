# MusicAI

MusicAI is a SENA ADSO educational project focused on learning Functional Harmony applied to Guitar through a mobile-first prototype. The project is designed as a pedagogical and engineering exercise: the prototype is a UX and functional reference, while the future production target is a Flutter/Dart client with a Python/FastAPI backend, JWT authentication, SQL Server persistence and Python-based DSP.

None of the production architecture is implemented in this repository. This repo is a static prototype with simulated behavior only.

## MVP scope

The current approved functional scope is closed at R01–R40. The prototype must not add functionality by inference or broaden the user stories without a new Task Contract approved by JuanC.

## Documentation structure

```text
MusicAI/
├── 00_Documentation/
│   ├── architecture/
│   ├── requirements/
│   │   ├── functional-baseline-v3.md
│   │   ├── propuesta-tecnica-v1.pdf
│   │   ├── user-stories-v1.pdf
│   │   ├── MusicAI_Functional_Baseline_V3.2.md
│   │   └── user-stories-v2.xlsx
│   └── site-map/
│       └── site-map-v2.png
├── 01_Design/
│   └── mockups/
├── 02_Source/
│   ├── assets/    # reserved for application resources; currently empty and therefore untracked by Git
│   ├── pages/
│   ├── css/
│   ├── js/
│   ├── html/
│   └── index.html
├── 03_Scripts/      # reserved for tooling; currently empty, therefore untracked by Git
├── index.html
├── README.md
├── CLAUDE.md
└── .gitignore
```

## Prototype status

This repository contains a navigable static prototype with simulated behavior. It currently covers:

- Login
- Home
- Learning Path
- Interactive Exercise
- Exercise Result
- Challenges & Achievements
- Community
- Progress Detail
- Profile
- Assistant Panel

It does not yet cover the approved but unimplemented flows for:

- Registration (R01)
- Password recovery (R03)
- Tuner (R39–R40)
- Notifications inbox
- Assistant internal navigation
- Profile editing
- Community contacts
- Community profile

## Running the prototype

- Open the repository root in VS Code and serve it with Live Server.
- The workspace setting already points Live Server to /02_Source via .vscode/settings.json.
- Always run the prototype over HTTP, never via file://, because the Assistant Panel loads its partial with fetch() and that call fails under file://.
- Both index.html files are redirect entry points, not the application itself: the repository root redirects to 02_Source/pages/login.html and 02_Source/index.html redirects to pages/login.html.
- Vercel is the current public deployment channel and serves the project from the repository root.

## Relationship to the future product

The prototype is a UX and functional reference for the eventual MusicAI product. The production architecture is planned as Flutter/Dart for the client, with a Python/FastAPI backend, JWT authentication, SQL Server persistence, and Python DSP capabilities. That architecture is prospective only and is not implemented in this repository.

## Project principles

- HTML5, CSS3 and Vanilla JavaScript only
- No backend, API, database, real authentication, real AI model or real DSP in the prototype
- No frameworks, no CDNs, no external dependencies and no build tooling
- Relative paths only; no absolute paths
- Human-in-the-loop governance: JuanC approves the work and controls repository state
- No functionality is added by inference beyond the approved MVP scope
