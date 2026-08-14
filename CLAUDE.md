# MusicAI — repository guardrails for Claude agents

This file records the repository rules for any Claude agent working in MusicAI. The active role and the authorized scope come from the current Task Contract, not from this file.

JuanC is the Product Owner, final approver and sole controller of repository state. Agents execute approved Task Contracts, work within the authorized file list and stop when a decision is missing or a requirement is unclear.

---

## Governance and execution model

### Human in the loop

- JuanC is the final approver and the single authority for repository state.
- Agents are execution assistants, not decision-makers.
- Any missing decision, conflicting requirement or ambiguity must be reported and the task must stop.
- Git operations are forbidden. This includes creating or switching branches, staging, committing, pushing, pulling, fetching, merging, rebasing, resets, stashes, tag creation and PR creation.

### Tool responsibility model

- Repository inspection and evidence gathering are mandatory before proposing or making any change.
- The current Task Contract defines the exact scope, file list and allowed operations.
- Agents inspect the real repository state, confirm the authoritative sources and then implement only the authorized modifications.
- If a document or source contradicts an authoritative requirement, report the specific contradiction and stop only if the corrected fact changes what the task is allowed to modify.
- Review-mode work is limited to identifying risks, contradictions and requirement drift; it does not rewrite implementation or architecture without explicit approval.

---

## Canonical sources

The authoritative sources for this repository are:

- 00_Documentation/requirements/functional-baseline-v3.md
- 00_Documentation/requirements/user-stories-v1.pdf
- 00_Documentation/site-map/site-map-v2.png

Do not duplicate the full baseline or user-story tables inside this file. Use them as the source of truth for UX, navigation and revoked decisions.

---

## Approved / canonical behavior

This layer describes what is required by R01–R40, the Functional Baseline V3 and the approved navigation map. It is not a statement that the current repository has already implemented this behavior.

### MVP scope and invariants

- The MVP functional scope is closed at R01–R40.
- No functionality is added by inference.
- Any change altering a user story must return to JuanC as a new decision.
- Academic progress is not the same as total XP.
- Total XP is not the same as weekly XP.
- Streak is not academic progress.
- Challenges are not Community shared challenges.
- Achievements are not special rewards.
- Library is not contextual memory.
- Restart attempt is not repeat exercise.
- Personal profile is not community profile.
- Notification received is not action executed.
- Selected target string is not detected note.

### Canonical navigation and terminology

The approved global shell is:

| Canonical (English) | UI label (Spanish) | User stories |
| ------------------- | ------------------ | ------------ |
| Home                | Inicio             | R04–R09, R12 |
| Tuner               | Afinador           | R39–R40      |
| MusicAI Assistant   | IA MusicAI         | R20–R26      |
| Challenges          | Desafíos           | R27–R29      |
| Community           | Comunidad          | R30–R33      |

The canonical bottom navigation is exactly:

1. Home
2. Tuner
3. MusicAI Assistant
4. Challenges
5. Community

The UI remains in Spanish while file and class names remain English kebab-case.

### Focus Mode

Focus Mode is an approved invariant during active execution of an Interactive Exercise. During active execution, the global header and bottom navigation are hidden, and there is no access to the MusicAI Assistant, Profile, Notifications, Tuner, Challenges or Community. Only exercise-specific controls remain: pause/resume, restart and abandon.

Focus Mode is approved but not yet implemented in the current prototype, because the current exercise screen still renders the bottom navigation and an assistant trigger.

### Global shell and header approval

- Profile and Notifications belong to the global header of standard authenticated screens, with context-dependent visibility.
- The global shell remains approved even when a specific page chooses to hide or simplify header controls.
- A reusable global header partial is not authorized without explicit approval.
- No shell centralization is authorized for app-header, bottom-nav or shared fetch-based injection.

### Revoked decisions

The following decisions are revoked and must not be reintroduced by accident:

- Route as an independent destination
- Level and Lesson as standalone screens
- A separate Profile Settings screen
- Projects inside the Assistant
- Hint button
- Manual Finish button
- Info inside the Interactive Exercise
- Academic progress computed from XP
- Recent activity on Home
- Special rewards from normal exercises
- Visible tuner calibration
- Custom tunings
- Store, coins, seasons, social feed, chat, followers or groups

---

## Currently implemented behavior

This layer describes what actually exists in the current repository at this HEAD. It is intentionally separated from the approved behavior, and it must not be mistaken for the canonical MVP.

### 1. Login — currently implemented

Files:

- 02_Source/pages/login.html
- 02_Source/css/login.css
- 02_Source/js/login.js

State:

- Static login prototype.
- Simulated validation against hardcoded credentials in the page logic.
- Valid credentials redirect to home.html.
- Invalid credentials show an inline role="alert" message.
- Password visibility toggle exists locally.
- The current login prototype still contains visual Google/Apple actions, but the approved MVP uses email + password only and those external providers are scheduled for removal.
- Registration and password recovery are approved but not yet implemented.

### 2. Home — currently implemented

Files:

- 02_Source/pages/home.html
- 02_Source/css/home.css
- 02_Source/js/home.js

State:

- Home is the main navigation hub in the current prototype.
- It is the only screen that currently exposes the global main header with avatar access, brand and notifications.
- The current implementation shows Profile and Notifications on Home, but this is a current implementation detail, not the canonical global shell requirement.
- Progress card links to progress-detail.html.
- Quick action “Continuar aprendizaje” links to learning-path.html?continue=1.
- Recent Activity displays the latest five entries only.
- Bottom navigation currently marks Inicio active.

### 3. Learning Path / Ruta de aprendizaje — currently implemented

Files:

- 02_Source/pages/learning-path.html
- 02_Source/css/learning-path.css
- 02_Source/js/learning-path.js

State:

- This is a currently implemented screen, but it is not canonical.
- The approved canonical behavior treats Home and Route as one experience, Home/Ruta.
- learning-path.html is scheduled for absorption into the Home/Ruta experience and later deletion.
- It currently uses a module header and a return link to home.html.
- It contains the hierarchy Level → Lesson → Exercise and honors the continue flow via ?continue=1.
- Bottom navigation currently marks Ruta active, which is a deviation from the canonical bottom nav.

### 4. Interactive Exercise / Ejercicio interactivo — currently implemented with approved deviations

Files:

- 02_Source/pages/interactive-exercise.html
- 02_Source/css/interactive-exercise.css

State:

- This is the current exercise screen used by the prototype.
- It includes a global-style header and current bottom navigation markup even though Focus Mode is approved but not yet implemented.
- The screen still contains action buttons that are deviations from the approved behavior: there is no manual Finish button, no Hint button, and no Info button in the approved exercise UX.
- The current screen still renders the Assistant trigger and bottom nav; this is a known implementation deviation to be corrected in a later task.
- The current static prototype does not include real DSP or audio analysis logic.

### 5. Exercise Result / Resultado del ejercicio — currently implemented

Files:

- 02_Source/pages/exercise-result.html
- 02_Source/css/exercise-result.css

State:

- Static exercise result screen.
- Shows summary, feedback, strengths and improvement areas.
- “Repetir ejercicio” links back to interactive-exercise.html.
- The result screen is visually complete, but it is not a production evaluation backend.

### 6. Challenges & Achievements / Desafíos y Logros — currently implemented

Files:

- 02_Source/pages/challenges-achievements.html
- 02_Source/css/challenges-achievements.css

State:

- Static gamification screen.
- Current implementation includes XP, achievements, streak and progress panels.
- Bottom navigation currently marks Desafíos active.

### 7. Community / Comunidad — currently implemented

Files:

- 02_Source/pages/community.html
- 02_Source/css/community.css

State:

- Static community screen.
- Shows ranking, practice partners/contacts, shared challenges and community achievements.
- Bottom navigation currently marks Comunidad active.

### 8. Progress Detail / Detalle del progreso — currently implemented

Files:

- 02_Source/pages/progress-detail.html
- 02_Source/css/progress-detail.css

State:

- Secondary full-screen detail page.
- It is a transversal screen, not a canonical bottom-nav destination.
- No active bottom-nav item is expected on this page.
- It uses the Assistant Panel via data-assistant-trigger.

### 9. Profile / Perfil — currently implemented

Files:

- 02_Source/pages/profile.html
- 02_Source/css/profile.css

State:

- Profile exists as a full secondary screen in the current prototype.
- The consolidated MVP profile behavior is approved as a single Profile screen; Profile and Profile Settings are consolidated for the MVP.
- R35 will be implemented within the existing Profile screen.
- The personal Profile is not a bottom-navigation destination.
- The community profile is a different concept (R33) and must not be confused with the personal Profile.
- Profile actions remain visual only.

### 10. Assistant Panel — currently implemented component

Files:

- 02_Source/html/assistant-panel.html
- 02_Source/css/assistant-panel.css
- 02_Source/js/assistant-panel.js

State:

- The Assistant Panel is a reusable bottom-sheet overlay component.
- It is opened using [data-assistant-trigger].
- It fetches ../html/assistant-panel.html from page contexts.
- It requires HTTP and fails under file://.
- Approved internal navigation is New chat / Library / Settings, with voluntary contextual memory and no Projects section.
- This internal navigation is approved but not yet implemented.
- No assistant.html file will be created.

### 11. Tuner / Afinador — approved but not yet implemented

State:

- The Tuner is an approved canonical module, but no implementation exists in the current repository.
- It must reuse the same six-string visual system as the Interactive Exercise, with no second palette.

### 12. Registration and password recovery — approved but not yet implemented

State:

- R01 and R03 are approved and required by the MVP, but they are not implemented in the repository.
- The current login screen is a prototype-only entry flow.
- Google and Apple are approved for removal; the MVP keeps email + password only.

---

## Project architecture and constraints

### Technology constraints

- HTML5, CSS3 and Vanilla JavaScript only.
- No backend, no API, no database, no real authentication, no real AI model and no real DSP.
- No frameworks, no CDNs, no external dependencies, no build tools, no new image assets, no SVG files, no icon fonts.
- Icons are Unicode characters.
- JavaScript exists only where truly needed and the prototype behavior is simulated locally.

### Relative-path rule and hosting

- Internal references must use relative paths only.
- The Live Server root is configured in .vscode/settings.json as /02_Source.
- The repository root index.html and the 02_Source/index.html files are redirect entry points, not application screens.
- Vercel serves the project from the repository root.
- No vercel.json is added unless a future real deployment issue requires it.

### Repository structure

```text
MusicAI/
├── 00_Documentation/
│   ├── architecture/
│   ├── requirements/
│   │   ├── functional-baseline-v3.md
│   │   └── user-stories-v1.pdf
│   └── site-map/
│       └── site-map-v2.png
├── 01_Design/
│   └── mockups/
├── 02_Source/
│   ├── css/
│   ├── html/
│   ├── js/
│   ├── pages/
│   └── index.html
├── 03_Scripts/    # reserved for tooling; currently empty and therefore untracked by Git
├── .github/       # created only for authorized bootstrap files
├── index.html
├── README.md
├── CLAUDE.md
└── .gitignore
```

Do not change the architecture or create extra folders without explicit authorization. The 03_Scripts directory may exist locally as an empty reserved directory, but it must never contain application code.

---

## Reuse boundaries and accepted duplication

- Local :root palettes are accepted to remain duplicated across page CSS files.
- Inline bottom-nav markup remains accepted for traceability.
- No shell centralization is authorized: no app-header.html, no bottom-nav.html, no shell.js and no fetch-based injection for global chrome.
- No global CSS token refactor is authorized.
- No shared component or new abstraction layer is authorized without explicit approval.

---

## Interaction Feedback Policy (approved)

CSS-only interaction feedback is approved across the prototype, including on inert elements:

- Allowed states: :hover, :active and :focus-visible when the element is naturally focusable.
- Allowed properties: transform, color, border-color, box-shadow, opacity and background.
- Disabled or locked elements keep minimal feedback and must not become interactive.
- Inert elements must never receive href, click handlers, alerts, toasts or JavaScript behavior.
- If a button has no destination and no handler, it gets the disabled attribute.
- Navigation is activated only when a destination exists.
- Transitions must not fire on page load.

---

## Visual Rules

- Mobile-only prototype.
- No tablet/desktop layout redesigns unless explicitly approved.
- The .app container simulates a phone viewport (max-width: 430px, centered).
- Dark theme, purple/blue gradients, musical decoration.
- Keep visual consistency with existing screens.
- Icons: Unicode only.
- No new images, SVG files, icon fonts or external assets.
- Canonical page background (frozen): #0A0A14, applied to each screen's existing root container (.app on 8 screens, .login-screen on Login) via --color-bg or an equivalent local variable. The container sits over a pure #000000 outer canvas on body, framed by border-radius: 24px, border: 1px solid rgba(255,255,255,0.06) and box-shadow: 0 24px 64px rgba(0,0,0,0.5), centered at the existing max-width. Card surfaces, bottom nav, overlays, borders, brand purples and text colors are unaffected.
- Canonical card surface (frozen): #2A1C42, set via each screen's --color-card-bg, over the #0A0A14 container background.
- Bottom nav is position: sticky; bottom: 0; width: 100%; (not fixed) as a direct child of .app, with no left/transform centering.
- .app/.login-screen do not set overflow; never set overflow: hidden on the container because it disables position: sticky on .bottom-nav.
- Bottom spacing before .bottom-nav (frozen): var(--space-md) (16px) via padding-bottom on each screen's main content wrapper; Learning Path reaches the same gap incidentally through the last route step margin.
- Interactive Exercise six-string color mapping (frozen): string 1 (E alto) coral #F87171, string 2 (B) #FBBF24, string 3 (G) #22D3EE, string 4 (D) #84CC16, string 5 (A) uses the generic --color-orange #F59E0B, string 6 (E grave) electric blue #60A5FA. No purple on any string. This asymmetry is a known issue with a pending design decision; do not rename tokens or introduce a new colour value.
- The Tuner must reuse exactly this same six-string visual system, with no second palette.
- Interactive Exercise tuning legend shows all 6 strings; the two E markers ("e" high, "E" low) carry distinguishing aria-labels.

---

## Code Style

- Semantic HTML5.
- Correct heading hierarchy.
- One purpose-driven h1 per screen.
- Lists for lists.
- Real links only for real destinations.
- Buttons for actions.
- Labels tied to inputs when inputs exist.
- aria-hidden="true" on decorative elements.
- role="alert" for form errors.
- .visually-hidden utility when needed.
- Clean CSS organized in sections with beginner-friendly comments.
- JavaScript uses IIFE, "use strict" and no globals.
- Never use inline styles, inline JavaScript, frameworks, CDNs, external dependencies or build tools.
- The didactic-comment standard remains in force: code carries beginner-friendly comments explaining what important blocks do and why, without commenting obvious lines.

---

## Assistant Panel rules

- The Assistant Panel is the only justified transversal overlay-style component.
- It is not an independent screen.
- It is opened by [data-assistant-trigger].
- It fetches ../html/assistant-panel.html from page contexts.
- It is accessed primarily through the central IA MusicAI bottom-nav button.
- It requires HTTP; it fails under file://.
- No assistant.html file will be created.
- Approved internal navigation: New chat / Library / Settings.
- Contextual memory is voluntary and allowed.
- There is no Projects section in the approved Assistant structure.
- Do not duplicate page-specific bot cards near the bottom nav.

---

## Development workflow, protocol and review mode

- Inspect the repository and available evidence before proposing or implementing a change.
- Read the authoritative sources before editing.
- Modify only the files in the current Task Contract.
- Keep changes narrow, traceable and easy to review.
- Do not broaden scope, invent screens or create speculative abstractions.
- Review mode is for identifying defects and contradictions, not for rewriting implementation without authority.
- If repository evidence contradicts a requirement, report the specific contradiction and stop if the corrected fact changes what the task is permitted to modify.
- Never anticipate future work. Do not implement future screens, unrequested components or speculative reusable structures.

### Modification protocol

- Identify which file needs to change, the exact section and why it is necessary.
- Prefer small, localized edits.
- Preserve the existing structure and comments unless the task explicitly requires otherwise.
- Do not touch files outside the authorized list.
- Stop if there is any requirement that needs reinterpretation.
- Before changing any existing file, identify which file needs to change, the exact section and why it is necessary.
- When applying changes, do not recreate full files unnecessarily; do not replace working code unless explicitly authorized; do not modify unrelated sections; preserve comments, structure and naming unless the prompt asks otherwise; keep changes small, traceable and easy to review.

### Project principles

- No invention of requirements, navigation, screens, components or architecture.
- No speculative refactors or shared components.
- No functionality added by inference.
- No new dependencies without approval.
- The prototype is not the production Flutter/FastAPI architecture and must not be treated as such.
- The Human-in-the-Loop governance remains in force through all execution steps.
- Create no unnecessary folders or files.
- Do not create shared components without explicit authorization.
- Do not modify previously approved architecture.
- Do not touch Login files, index files, .vscode/settings.json, .gitignore, README.md or this file unless the prompt explicitly authorizes it.
- Do not claim backend, AI, DSP, account persistence or real authentication exists.
- Commit or push are forbidden.
- When asked to review code, do not modify files, rewrite, refactor or optimize; instead, detect bugs, inconsistencies, duplication beyond the accepted list, accessibility problems and maintainability risks and explain findings clearly before a decision is made.

---

## References

Use these as the canonical references for decisions and navigation:

- 00_Documentation/requirements/functional-baseline-v3.md
- 00_Documentation/requirements/user-stories-v1.pdf
- 00_Documentation/site-map/site-map-v2.png

Do not paste the full baseline, the full user-story table or the project history into this file.

- No real DSP/audio analysis exists.
- GitHub Pages deployment became unreliable; Vercel is the current working public deployment channel.
- Profile and Profile Settings are consolidated into a single Profile screen for the MVP.
- R35 is approved but not yet implemented within the existing Profile screen.
- The personal Profile is not a bottom-navigation destination; the community profile is a different concept (R33) and must not be confused with the personal Profile.
- The Notifications inbox required by R36–R38 is approved but not yet implemented. Currently, notifications exist only as a local dropdown on Home.
- R18 belongs to Progress Detail; the learning-history section is already part of that screen.
- No separate custom exercise screen should be created prematurely; use `interactive-exercise.html`.
- Shared bottom nav/header components have not been extracted intentionally; duplication is accepted until a real reuse/refactor need is authorized.
- Do not reintroduce redundant bot cards near the bottom nav because Assistant access already exists through the central bottom nav button.
