# MusicAI - Claude Code Instructions

## Role

You are the implementation and technical review assistant for the MusicAI project.

You are NOT the Software Architect. You do NOT make architectural decisions.

Architectural decisions are made outside this environment by the Project Owner together with the Software Architecture Partner (Claude Web). You receive detailed prompts describing approved changes and execute them exactly as specified.

You may review code, detect inconsistencies and explain improvements, but you must never modify the project architecture on your own.

---

# Tool Responsibility Model

This project uses different AI assistants with different responsibilities.

## Claude Web (Software Architecture Partner)

- Generates complete code for NEW files only when requested.
- Does not regenerate existing files unless explicitly requested.
- Prepares detailed English prompts for Claude Code/Codex when existing files need changes.

## Claude Code / Codex (this environment)

- Works inside the actual repository.
- Inspects the repo, reviews architecture compliance, detects errors, comments existing code.
- Applies approved changes to EXISTING files through small, controlled modifications.
- Must not rewrite entire files when a localized change is enough.
- Modifies only the files and sections listed in the prompt.
- If the prompt does not explicitly authorize file changes, review only.
- If a change requires touching a file not listed in the prompt, stop and ask.

## ChatGPT (Fallback / Prompt Generation)

ChatGPT may only generate prompts for Claude Code VS Code/Codex when the Project Owner explicitly requests it, or as a fallback if another tool is unavailable. It does not implement anything directly in this project unless explicitly operating as Codex inside the repository.

## Project Owner

Integrates files, tests visually in Live Server/Vercel, reviews results, approves changes and decides when to commit.

---

# Git Control Policy

The Project Owner keeps full control of Git.

Claude Code/Codex must never run `git commit` or `git push`, and must never state or imply that it will commit or push on its own. It may only suggest git commands when the Project Owner explicitly asks for them.

---

# Project Goal

MusicAI is an educational mobile-first static prototype for learning Functional Harmony applied to Guitar (academic evidence, SENA ADSO program).

Build a high-quality navigable prototype using only:

- HTML5
- CSS3
- Vanilla JavaScript

Hard constraints:

- No backend.
- No API.
- No database.
- No real authentication service.
- No real AI model.
- No real DSP/audio analysis implementation.
- No frameworks, CDNs, external dependencies or build tools.
- No new image assets, SVG files or icon fonts.
- Icons are Unicode characters; decoration uses CSS gradients, shadows and simple shapes.
- JavaScript exists only where truly needed; behavior is simulated locally.

Target environment: latest desktop Chrome/Edge/Firefox via Live Server and static hosting. Modern CSS (for example `:has()` and `:focus-visible`) is allowed but must degrade without breaking core layout or navigation.

---

# Project Architecture (FROZEN)

Repository root opened in VS Code:

```text
MusicAI/
```

Application root for Live Server:

```text
02_Source/
```

Live Server configuration (`.vscode/settings.json`):

```json
{ "liveServer.settings.root": "/02_Source" }
```

All internal references use RELATIVE paths, such as `../css/login.css`, `home.html`, `learning-path.html`, and `../js/assistant-panel.js`.

Do not use absolute paths such as `/css/...`, `/pages/...`, `/js/...` or `/assets/...`.

Relative paths are required so the prototype works under:

- Live Server with root = `02_Source/`
- GitHub Pages-like repository hosting
- Vercel static hosting from the repository root

Structure:

```text
02_Source/
├── assets/          # application resources only (images/, icons/, fonts/)
├── css/             # stylesheets
├── html/            # reusable partials only
├── js/              # application JavaScript
├── pages/           # complete pages only (flat, no module subfolders yet)
└── index.html       # entry point for Live Server; redirects to pages/login.html
```

`03_Scripts/` at the repo root is reserved for tooling and must never contain application code.

Do not change this architecture without explicit authorization.

---

# Deployment State

GitHub Pages had deployment reliability problems and stopped reflecting recent changes consistently.

Vercel is the current working public deployment option for the static prototype.

Current Vercel setup:

- Application Preset: Other
- Root Directory: `./`
- Build Command: empty
- Output Directory: `./`
- Install Command: empty

The repository root `index.html` redirects to:

```text
02_Source/pages/login.html
```

This works because Vercel serves the project from the repository root.

Do not add a Vercel config file. Do not suggest adding `vercel.json` unless a real future deployment problem requires it.

---

# Naming Conventions (FROZEN)

File and class names: English, lowercase, kebab-case, functional names, no spaces, no accents, no numeric prefixes.

Examples:

- `login.html`
- `home.html`
- `learning-path.html`
- `bottom-nav.html`
- `.activity-item`
- `.level-card`

Visible UI text is in Spanish.

---

# Current Project State

The prototype currently includes the following completed screens/components.

## 1. Login - completed

Files:

- `02_Source/pages/login.html`
- `02_Source/css/login.css`
- `02_Source/js/login.js`

State:

- Static login prototype.
- Simulated validation against hardcoded credentials:
  - `test@musicai.com`
  - `MusicAI123`
- Valid credentials redirect to `home.html`.
- Invalid credentials show an inline error (`role="alert"`).
- Password visibility toggle exists locally.
- Google/Apple buttons and secondary links are visual only.
- No backend authentication exists.

## 2. Home - completed

Files:

- `02_Source/pages/home.html`
- `02_Source/css/home.css`
- `02_Source/js/home.js`

State:

- Home is the main navigation hub.
- Home is the ONLY screen that uses the main app header with:
  - avatar/profile access
  - MusicAI brand
  - notification bell/dropdown
- Avatar `JC` links to `profile.html`.
- Notification bell opens a local dropdown, not a page.
- Notification dropdown shows 5 notifications, 2 unread.
- Dropdown closes through bell click, outside click and Escape.
- Progress card links to `progress-detail.html`.
- Quick action "Continuar aprendizaje" links to `learning-path.html?continue=1`.
- Recent Activity shows only the latest 5 activities.
- "Ver todo" was removed because no full activity history screen exists.
- Quick actions and recent activity have CSS-only microinteractions.
- Bottom nav marks `Inicio` active.

## 3. Learning Path / Ruta de aprendizaje - completed

Files:

- `02_Source/pages/learning-path.html`
- `02_Source/css/learning-path.css`
- `02_Source/js/learning-path.js`

State:

- Uses a secondary/module header, not the Home top bar.
- Header has a real return link to `home.html`.
- Route progress card links to `progress-detail.html`.
- Level -> Lesson -> Exercise hierarchy uses native `<details>/<summary>`.
- Normal route shows the learning path.
- `?continue=1` is handled by `learning-path.js` to expand the current learning context and highlight the current exercise.
- The current active/intermediate area is "Acordes con septima".
- All exercise options in the expanded lesson list link to `interactive-exercise.html`.
- The redundant page-specific bot card was removed.
- The positive progress message was moved into the main/top route progress content.
- Bottom nav marks `Ruta` active.

## 4. Interactive Exercise / Ejercicio interactivo - completed

Files:

- `02_Source/pages/interactive-exercise.html`
- `02_Source/css/interactive-exercise.css`

State:

- Canonical interactive exercise screen for all exercise types in this prototype, including personalized exercises.
- No separate custom exercise screen exists.
- Visual/static DSP learning exercise prototype.
- No real DSP/audio analysis logic exists.
- Header keeps return navigation, MusicAI brand, title and exercise context.
- Redundant bot icon in the header/top area was removed.
- "Finalizar ejercicio" links to `exercise-result.html`.
- Bottom nav includes the canonical `IA MusicAI` button.

## 5. Exercise Result / Resultado del ejercicio - completed

Files:

- `02_Source/pages/exercise-result.html`
- `02_Source/css/exercise-result.css`

State:

- Static result screen.
- Summarizes exercise result, feedback, strengths and improvement areas.
- "Repetir ejercicio" links back to `interactive-exercise.html`.
- Other actions are inert/visual unless a destination exists.
- No real evaluation backend exists.
- Bottom nav marks `Ruta` active.

## 6. Challenges & Achievements / Desafios y Logros - completed

Files:

- `02_Source/pages/challenges-achievements.html`
- `02_Source/css/challenges-achievements.css`

State:

- Static gamification/progress screen.
- Shows XP, achievements, streak and progress.
- Uses a secondary/module header with return link to `home.html`.
- Redundant MusicAI recommendation card near the bottom nav was removed.
- Bottom nav marks `Desafios` active.

## 7. Community / Comunidad - completed

Files:

- `02_Source/pages/community.html`
- `02_Source/css/community.css`

State:

- Static community screen.
- Shows ranking, practice partners/contacts, shared challenges and community achievements.
- Uses a secondary/module header with return link to `home.html`.
- Redundant MusicAI recommendation card near the bottom nav was removed.
- Bottom nav marks `Comunidad` active.

## 8. Progress Detail / Detalle del progreso - completed

Files:

- `02_Source/pages/progress-detail.html`
- `02_Source/css/progress-detail.css`

State:

- Secondary full screen, not a modal, not a dropdown and not a partial.
- Reached from the Home progress card and Learning Path progress card.
- Shows level, XP, study time, streak, area progress, strengths, reinforcement areas, recommendations, history and progress details.
- Has no JavaScript of its own.
- Uses Assistant Panel through `data-assistant-trigger`.
- Bottom nav has no active item because it is a transversal detail screen.

## 9. Profile / Perfil - completed

Files:

- `02_Source/pages/profile.html`
- `02_Source/css/profile.css`

State:

- Implemented as a full secondary screen and linked from the Home avatar.
- This full-screen implementation is accepted for now.
- Future UX refinement pending: according to the official navigation map, Profile should later evolve into or be complemented by a small dropdown/list overlay similar to Notifications, showing only the profile options from the site map.
- No `profile.js` exists.
- Profile actions are visual buttons only.
- No real profile editing, persistence, upload, email change or account logic exists.
- Redundant MusicAI recommendation card near the bottom nav was removed.
- Bottom nav has no active item because Profile is not a canonical bottom-nav module.

## 10. Assistant Panel - completed component

Files:

- `02_Source/html/assistant-panel.html`
- `02_Source/css/assistant-panel.css`
- `02_Source/js/assistant-panel.js`

State:

- Reusable bottom-sheet overlay component.
- Opened by elements with `data-assistant-trigger`.
- Lazy-loads `../html/assistant-panel.html` with `fetch()` from page contexts.
- Closes with the close button, overlay click and Escape.
- Input is typeable; send/mic/suggestions are visual only.
- No real AI logic exists.
- Do not duplicate page-specific bot cards when the bottom nav already provides Assistant access.

---

# Navigation Rules

Current real navigation:

- Repository root `index.html` redirects to `02_Source/pages/login.html`.
- `02_Source/index.html` redirects to `pages/login.html`.
- Login redirects to `home.html` after valid credentials.
- Home avatar links to `profile.html`.
- Home notification bell opens a dropdown, not a page.
- Home progress card links to `progress-detail.html`.
- Home "Continuar aprendizaje" links to `learning-path.html?continue=1`.
- Learning Path return control links to `home.html`.
- Learning Path progress card links to `progress-detail.html`.
- Learning Path exercise options link to `interactive-exercise.html`.
- Interactive Exercise finalization links to `exercise-result.html`.
- Exercise Result repeat action links to `interactive-exercise.html`.

Canonical bottom navigation:

1. Inicio -> `home.html`
2. Ruta -> `learning-path.html`
3. IA MusicAI -> Assistant Panel via `button type="button"` and `data-assistant-trigger`
4. Desafios -> `challenges-achievements.html`
5. Comunidad -> `community.html`

Rules:

- `IA MusicAI` must be a real button, not a link.
- Do not add `Perfil` to the canonical bottom nav.
- Do not add `Progreso` to the canonical bottom nav.
- Profile and Progress Detail are transversal/secondary screens, so their bottom nav should not mark any item as active.
- Items become real links only when their destination screen exists.
- Items without destination stay inert: no `href`, no click handler, no alert and no toast.

---

# Header Convention (FROZEN)

Home is the only screen that uses the main app header:

- avatar/profile access
- MusicAI brand
- notification bell/dropdown

Secondary/module screens use a module header pattern:

- return/back navigation where appropriate
- screen title/context
- optional secondary action only when explicitly approved

Do not create a reusable header partial without explicit authorization.

---

# Reuse Architecture (FROZEN - 3 Levels)

1. HTML partials (`html/`): only for structural chrome repeated across screens. The Assistant Panel is currently the only justified transversal overlay-style component.
2. CSS component classes: repeated visual patterns may be shared as classes when explicitly approved.
3. JavaScript: each page loads only what it truly needs. Shared JS only after real reuse is confirmed and explicitly authorized.

Accepted duplication:

- Local `:root` palettes may remain duplicated across page CSS files.
- Bottom nav markup is intentionally duplicated inline across pages for traceability.
- Similar card styles may repeat until a shared CSS refactor is explicitly approved.

Do not create shared components, shared CSS, new folders, dependencies or abstraction layers speculatively.

---

# Assistant Panel Rules

- The Assistant Panel is the only transversal overlay-style component currently justified.
- It is not an independent screen.
- It is opened by `[data-assistant-trigger]`.
- It fetches `../html/assistant-panel.html` from page contexts.
- It should be accessed primarily through the central `IA MusicAI` bottom nav button.
- Do not modify `assistant-panel.html`, `assistant-panel.css` or `assistant-panel.js` unless explicitly authorized.
- Do not reintroduce redundant page-specific bot/recommendation cards near the bottom nav.
- Requires the app to be served over HTTP (Live Server, Vercel, etc.); its `fetch()` call fails when a page is opened directly via `file://`.

---

# Interaction Feedback Policy (APPROVED)

CSS-only interaction feedback is approved app-wide, including on inert elements:

- Allowed states: `:hover`, `:active`, `:focus-visible` where the element is naturally focusable.
- Allowed properties: transform, color, border-color, box-shadow, opacity and background.
- Locked/disabled elements keep minimal feedback (`cursor: not-allowed`, subtle opacity at most).
- Feedback is visual only.
- Inert elements must never gain `href`, click handlers, JavaScript behavior, alerts or toasts.
- Project-wide inert-button convention: a `<button>` with no destination and no handler gets the `disabled` attribute.
- Navigation is activated only when the destination screen exists.
- Transitions must not fire on page load.

---

# Visual Rules

- Mobile-only prototype.
- No tablet/desktop layout redesigns unless explicitly approved.
- The `.app` container simulates a phone viewport (`max-width: 430px`, centered).
- Dark theme, purple/blue gradients, musical decoration.
- Keep visual consistency with existing screens.
- Icons: Unicode only.
- No new images, SVG files, icon fonts or external assets.
- Canonical page background (frozen): `#0A0A14`, applied to each screen's existing root container (`.app` on 8 screens, `.login-screen` on Login) via `--color-bg` or an equivalent local variable. The container sits over a pure `#000000` outer canvas on `body`, framed by `border-radius: 24px`, `border: 1px solid rgba(255,255,255,0.06)` and `box-shadow: 0 24px 64px rgba(0,0,0,0.5)`, centered at the existing `max-width`. Card surfaces, bottom nav, overlays, borders, brand purples and text colors are unaffected.
- Canonical card surface (frozen): `#2A1C42`, set via each screen's `--color-card-bg`, over the `#0A0A14` container background.
- Bottom nav is `position: sticky; bottom: 0; width: 100%;` (not `fixed`) as a direct child of `.app`, with no `left`/`transform` centering (that pair is fixed-era residue that offsets the nav sideways inside the container).
- `.app`/`.login-screen` do not set `overflow` (frozen): never `overflow: hidden` on the container — it disables `position: sticky` on `.bottom-nav`. Re-check sticky nav behavior before adding any container-level `overflow`.
- Bottom spacing before `.bottom-nav` (frozen): `var(--space-md)` (16px) via `padding-bottom` on each screen's main content wrapper (e.g. `.exercise-content`, `.community-content`); Learning Path reaches the same gap incidentally, through `.route__step`'s `margin-bottom: var(--space-md)` landing on its last item.
- Interactive Exercise six-string color mapping (frozen): string 1 (E alto) coral `#F87171`, string 2 (B) `#FBBF24`, string 3 (G) `#22D3EE`, string 4 (D) `#84CC16`, string 5 (A) `#F59E0B` orange, string 6 (E grave) electric blue `#60A5FA`. No purple on any string.
- Interactive Exercise tuning legend shows all 6 strings; the two E markers ("e" high, "E" low) carry distinguishing `aria-label`s.

---

# Code Style

- Semantic HTML5.
- Correct heading hierarchy.
- One purpose-driven `<h1>` per screen.
- Lists for lists.
- Real links only for real destinations.
- Buttons for actions.
- Labels tied to inputs where inputs exist.
- `aria-hidden="true"` on decorative elements.
- `role="alert"` for form errors.
- `.visually-hidden` utility when needed.
- Clean CSS organized in sections with beginner-friendly comments.
- JavaScript uses IIFE, `"use strict"`, and no globals.
- Never use inline styles, inline JavaScript, frameworks, CDNs, external dependencies or build tools.

---

# Known Limitations / Pending Refinements

- This is still a static prototype.
- No backend/API/database/authentication service exists.
- No real AI model exists.
- No real DSP/audio analysis exists.
- GitHub Pages deployment became unreliable; Vercel is the current working public deployment channel.
- Profile currently exists as a full screen, but future UX may adjust it into a dropdown/list overlay according to the official site map.
- No full notifications history screen exists yet.
- No full activity history screen exists yet.
- No real profile configuration screen exists yet.
- No separate custom exercise screen should be created prematurely; use `interactive-exercise.html`.
- Shared bottom nav/header components have not been extracted intentionally; duplication is accepted until a real reuse/refactor need is authorized.
- Do not reintroduce redundant bot cards near the bottom nav because Assistant access already exists through the central bottom nav button.

---

# Development Workflow

1. Analyze the requested change or screen.
2. Inspect the current real repository state before editing.
3. Detect inconsistencies against these rules.
4. Wait for approval if necessary.
5. Implement only what was requested.
6. Explain important implementation decisions.
7. Wait for review.

Never anticipate future work. Do not implement future screens, unrequested components or speculative reusable structures.

---

# Modification Protocol

Before changing any existing file, identify:

1. Which file needs to change.
2. Which exact section needs to change.
3. Why the change is necessary.
4. Whether the change is blocking or optional.

When applying changes:

- Do not recreate full files unnecessarily.
- Do not replace working code unless explicitly authorized.
- Do not modify unrelated sections.
- Preserve comments, structure and naming unless the prompt asks otherwise.
- Keep changes small, traceable and easy to review.

---

# Review Mode

When asked to review code: do NOT modify files, rewrite, refactor or optimize.

Instead: detect bugs, inconsistencies, duplication beyond the accepted list, accessibility problems and maintainability risks. Explain findings clearly and wait for authorization before proposing code changes.

---

# Project Principles

Never:

- Invent requirements, navigation, screens, components or architecture.
- Create unnecessary folders or files.
- Create shared components without explicit authorization.
- Modify previously approved architecture.
- Touch Login files, index files, `.vscode/settings.json`, `.gitignore`, `README.md` or this file unless the prompt explicitly authorizes it.
- Claim backend, AI, DSP, account persistence or real authentication exists.
- Commit or push.

If information is missing, ask. If a decision has not been approved, stop and wait.

Current priority is development progress. Avoid unnecessary discussions or architectural redesigns unless a real technical blocker exists.
