# MusicAI

MusicAI is an academic software project developed within the SENA **Análisis y Desarrollo de Software (ADSO)** program.

The project focuses on interactive learning of **Functional Harmony applied to Guitar**, combining structured musical education, interactive exercises, academic progress tracking, intelligent assistance, and planned real-time musical analysis.

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

MusicAI has progressed from its static HTML/CSS/JavaScript prototype to an initial Flutter/Dart implementation for Android.

The repository includes:

- approved functional requirements R01–R40;
- the current Functional Baseline V3.2;
- architecture documentation;
- UI/UX mockups;
- the existing navigable static prototype;
- an initial Flutter Android application under `03_App/`;
- repository-native agent governance;
- permanent role definitions;
- a Task Contract mechanism for controlled development.

### Initial Flutter Implementation

The initial Android implementation includes a demonstrative flow:

**Login → Home/Ruta**

The Login screen provides local form validation and simulated access.

Home/Ruta represents the approved learning hierarchy:

**Level → Lesson → Exercise**

The implementation includes local demonstration data, academic progress representation, navigation elements, and simulated destinations or interactions within the authorized scope.

This implementation was developed for the corresponding SENA Android evidence.

It does not represent a complete production application.

Authentication, backend services, database persistence, real AI inference, and DSP integration were not part of that initial implementation.

### Static Prototype

The HTML/CSS/JavaScript prototype remains available under `02_Source/`.

It serves as a supporting visual and interaction reference and is maintained separately from the Flutter application.

The prototype does not establish functional requirements or override approved documentation.

---

## Functional Scope

The approved MVP functional scope is closed at:

**R01–R40**

The canonical detailed functional source is:

`00_Documentation/requirements/user-stories-v2.xlsx`

Transversal UX, navigation, scope, invariants, governance boundaries, and revoked historical decisions are defined in:

`00_Documentation/requirements/MusicAI_Functional_Baseline_V3.2.md`

These documents define the approved product behavior.

Implementation progress must not be confused with functional scope approval.

Functionality must not be added by inference from prototypes, mockups, architecture documents, or historical artifacts.

---

## Target Architecture

The approved architectural direction is modular and primarily mobile-oriented.

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

Depending on the implementation needs and approved technical decisions:

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
- Possible cloud deployment

These technologies describe the **target architectural direction**.

The current Flutter implementation represents only an initial part of that architecture.

The inclusion of a technology in the architectural documentation does not imply that it has already been implemented or integrated.

---

## Architecture and Design Patterns

The current architecture documentation identifies the following principal patterns:

- MVC
- Singleton
- Factory Method
- Observer
- Strategy
- Facade

These patterns provide architectural guidance.

Their use must be justified by the responsibilities, complexity, and authorized scope of each implementation lot.

The initial Flutter implementation follows a lightweight separation of responsibilities appropriate to its demonstrative scope.

Architectural patterns must not be introduced mechanically or used to justify speculative abstractions.

### Architecture Sources

```text
00_Documentation/architecture/
├── arquitectura-patrones-v1.pdf
├── diagrama-componentes_v1.png
└── diagrama-despliegue-v1.png
```

These artifacts define the approved architectural direction and do not independently prove that all described components have been implemented.

---

## Repository Structure

The main repository areas are organized as follows:

```text
MusicAI/
├── .github/
│   └── copilot-instructions.md
├── .vscode/
├── 00_Documentation/
│   ├── architecture/
│   ├── requirements/
│   ├── roles/
│   ├── task-contract/
│   │   └── current.md
│   └── site-map/
├── 01_Design/
│   └── mockups/
├── 02_Source/
│   ├── css/
│   ├── html/
│   ├── js/
│   ├── pages/
│   └── index.html
├── 03_App/
│   ├── android/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app.dart
│   │   ├── login/
│   │   ├── shell/
│   │   ├── home_route/
│   │   └── simulation/
│   ├── test/
│   ├── pubspec.yaml
│   └── analysis_options.yaml
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── index.html
└── .gitignore
```

This tree summarizes the principal directories and files rather than listing every generated or supporting artifact.

### Repository Responsibilities

- `00_Documentation/`: project requirements, architecture, agent roles, and operational task contracts.
- `01_Design/`: UI/UX design assets and mockups.
- `02_Source/`: historical static prototype and its supporting implementation.
- `03_App/`: Flutter/Dart Android application.
- `AGENTS.md`: common repository governance.
- `CLAUDE.md`: Claude Code adapter.
- `.github/copilot-instructions.md`: GitHub Copilot adapter.
- `README.md`: human-facing project overview.

The repository structure must reflect actual implementation needs.

New modules, directories, or abstractions must not be created solely to anticipate future development.

---

## Static Prototype

The prototype under `02_Source/` was developed using:

- HTML5
- CSS3
- Vanilla JavaScript

It includes simulated interactions and visual representations of the MusicAI learning experience.

Its screens and components cover areas such as:

- Login
- Home and Learning Path
- Interactive Exercise
- Exercise Result
- Progress Detail
- Challenges and Achievements
- Community
- Profile
- Tuner
- MusicAI Assistant Panel

Some screens and interactions may reflect historical design decisions that have since been revised.

The prototype remains a supporting reference and is not the canonical definition of R01–R40.

---

## Running the Static Prototype

The static prototype can be served locally through an HTTP development server such as VS Code Live Server.

The repository contains VS Code workspace configuration supporting the prototype.

Use an HTTP context when testing functionality that dynamically loads HTML fragments.

Opening files directly through `file://` may prevent certain interactions from working as expected.

The existing entry points include:

- root `index.html`
- `02_Source/index.html`

The prototype and Flutter application must remain separate unless a future approved architectural decision changes that responsibility.

---

## Running the Flutter Application

The Flutter Android project is located at:

`03_App/`

The Flutter project root is identified by:

`03_App/pubspec.yaml`

### Requirements

- Flutter SDK
- Dart SDK
- Android development environment
- Compatible Android emulator or physical device

### Local Development

From the repository root:

```bash
cd 03_App
flutter pub get
flutter analyze
flutter test
flutter run
```

These commands respectively resolve project dependencies, perform static analysis, execute tests, and launch the application on an available compatible target.

For an Android debug APK:

```bash
flutter build apk --debug
```

The initial demonstrative application provides simulated interactions.

Running it does not require a production backend, database, or AI service within the scope of the completed Android evidence.

Future functionality and integrations will be implemented through separately approved development lots.

---

## Design References

UI/UX assets are stored under:

`01_Design/mockups/`

These mockups support visual consistency and approved interaction design.

They do not override canonical user stories or the Functional Baseline.

The navigation map is stored under:

`00_Documentation/site-map/site-map-v2.png`

The site map is an auxiliary navigation artifact.

When it differs from the approved functional sources, the canonical requirements and Functional Baseline take precedence.

---

## Repository Governance

MusicAI uses repository-native governance to coordinate analysis, architecture, implementation, and independent validation.

The common governance entry point is:

`AGENTS.md`

### Permanent Roles

```text
00_Documentation/roles/
├── atlas.md
├── daedalus.md
├── forge-fe.md
└── sentinel.md
```

The existing roles are:

- **Atlas:** requirements engineering, functional analysis, scope, and traceability.
- **Daedalus:** software architecture and significant technical design.
- **ForgeFE:** authorized Flutter/Dart frontend implementation.
- **Sentinel:** independent validation, compliance, and regression review.

Role-specific responsibilities and applicable technical standards are maintained in their corresponding Markdown files.

### Task Contracts

The operational Task Contract path is:

`00_Documentation/task-contract/current.md`

Only one Task Contract is operational at a time.

Its purpose is to delimit an approved work lot.

The latest approved contract replaces the previous contract at the operational path, while Git history preserves traceability.

### Tool-Specific Adapters

- `CLAUDE.md`
- `.github/copilot-instructions.md`

These adapters connect their respective tools to the shared governance defined in `AGENTS.md`.

They are not independent sources of product requirements, architecture, or permanent role responsibilities.

For the complete governance hierarchy, authorization rules, Git restrictions, and stop conditions, consult `AGENTS.md`.

---

## Development Workflow

MusicAI follows a controlled, human-supervised development process.

```text
Approved requirement or need
            ↓
     Functional analysis
            ↓
 Architecture / technical design
        when applicable
            ↓
     Approved Task Contract
            ↓
   Controlled implementation
            ↓
 Independent technical validation
            ↓
       Human review
            ↓
  Git integration and traceability
```

The workflow preserves the separation between requirements, architectural decisions, implementation, and verification.

Juan Carlos retains final decision-making authority over the project and Git state-changing operations.

Specific execution constraints belong to the active Task Contract and the applicable repository governance.

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

Technical decisions are expected to remain understandable, traceable, justified, and defensible within an academic software engineering context.

---

## Project Status

| Area                         | Current documented status                            |
| ---------------------------- | ---------------------------------------------------- |
| Functional scope             | R01–R40 defined                                      |
| Functional source            | `user-stories-v2.xlsx`                               |
| Transversal baseline         | V3.2                                                 |
| Architecture                 | Defined at project level                             |
| Static prototype             | Available under `02_Source/`                         |
| Flutter Android              | Initial demonstrative implementation under `03_App/` |
| Login                        | Simulated Flutter implementation                     |
| Home/Ruta                    | Simulated Flutter implementation                     |
| Backend integration          | Not included in the initial Flutter lot              |
| Database integration         | Not included in the initial Flutter lot              |
| Real AI integration          | Not included in the initial Flutter lot              |
| Real DSP integration         | Not included in the initial Flutter lot              |
| Repository-native governance | Established                                          |

MusicAI continues its controlled development from validated requirements, architecture, and prototype references toward a progressively implemented mobile application.

The project preserves functional traceability, architectural consistency, independent validation, and human oversight throughout its evolution.
