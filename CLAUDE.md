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

- Generates complete code for NEW files only (new screens, newly approved components).
- Does not regenerate existing files unless explicitly requested.
- Prepares detailed English prompts for Claude Code when existing files need changes.

## Claude Code (this environment)

- Works inside the actual repository.
- Inspects the repo, reviews architecture compliance, detects errors, comments existing code.
- Applies approved changes to EXISTING files through small, controlled modifications.
- Must not rewrite entire files when a localized change is enough.
- Modifies only the sections listed in the prompt; preserves everything else.
- If the prompt does not explicitly authorize file changes, review only.
- If a change requires touching a file not listed in the prompt, stop and ask.

## ChatGPT (Fallback / Prompt Generation)

ChatGPT may only generate prompts for Claude Code VS Code (or Codex) when the Project Owner explicitly requests it, or as a fallback if another tool is unavailable. It does not implement anything directly in this project.

## Project Owner

Integrates files, tests visually in Live Server, reviews results, approves changes and decides when to commit.

---

# Git Control Policy

The Project Owner keeps full control of Git. Claude Code must never run `git commit` or `git push`, and must never state or imply that it will commit or push on its own. Claude Code may only suggest git commands when the Project Owner explicitly asks for them.

---

# Project Goal

MusicAI is an educational mobile-only prototype for learning Functional Harmony applied to Guitar (academic evidence, SENA ADSO program).

Build a high-quality navigable prototype using only:

- HTML5
- CSS3
- Vanilla JavaScript

Hard constraints:

- No backend, database, APIs or real authentication.
- No frameworks, CDNs, external dependencies or build tools.
- No new image assets, SVG files or icon fonts. Icons are Unicode characters; decorations are CSS gradients, shadows and simple shapes.
- JavaScript exists only where truly needed; behavior is simulated locally.

Target environment: latest desktop Chrome/Edge/Firefox via Live Server. Modern CSS (e.g. `:has()`, `:focus-visible`) is allowed but must degrade without breaking core layout or navigation.

---

# Project Architecture (FROZEN)

Repository root opened in VS Code:

```text
MusicAI/
```

Application root served by Live Server:

```text
02_Source/
```

Live Server configuration (`.vscode/settings.json`):

```json
{ "liveServer.settings.root": "/02_Source" }
```

All internal references use RELATIVE paths (e.g. `../css/login.css`, `learning-path.html`), so the prototype works both under Live Server (root = 02_Source) and under GitHub Pages (root = repository root). A root-level `index.html` (outside 02_Source) redirects to `02_Source/pages/login.html` specifically for GitHub Pages. Do not convert relative paths back to absolute ones.

Structure:

```text
02_Source/
├── assets/          # application resources only (images/, icons/, fonts/)
├── css/             # stylesheets
├── html/            # reusable partials only (currently empty on purpose)
├── js/              # application JavaScript
├── pages/           # complete pages only (flat, no module subfolders yet)
└── index.html       # entry point for Live Server (root = 02_Source); redirects to pages/login.html (relative)
```

`03_Scripts/` (repo root) is reserved for tooling and must never contain application code.

Do not change this architecture.

---

# Naming Conventions (FROZEN)

File and class names: English, lowercase, kebab-case, functional names, no spaces, no accents, no numeric prefixes.

Examples: `login.html`, `home.html`, `learning-path.html`, `bottom-nav.html`, `.activity-item`, `.level-card`.

UI text visible to the user is in Spanish (file `learning-path.html` → screen title "Ruta de aprendizaje").

---

# Current Project State

All seven screens below are COMPLETED, integrated in the repository and verified.

## 1. Login — completed

Files: `pages/login.html`, `css/login.css`, `js/login.js`

- Local simulated validation against hardcoded test user: `test@musicai.com` / `MusicAI123`.
- Valid credentials redirect to `home.html`; invalid show an inline error (`role="alert"`).
- Google/Apple buttons and secondary links are visual only.

## 2. Home — completed

Files: `pages/home.html`, `css/home.css` (no `home.js` by decision; visual-only screen)

- The literal value `13:31` in the progress card stays exactly as-is (no label, no interpretation).
- The "Ruta" bottom-nav item is a real link to `learning-path.html`.

## 3. Learning Path (Ruta) — completed

Files: `pages/learning-path.html`, `css/learning-path.css` (no JavaScript)

- Level → Lesson → Exercise hierarchy built with native `<details>/<summary>` (no JS).
- Only "Intermedio" is expanded; `Básico`/`Elemental` are completed static cards; `Avanzado`/`Experto` are locked static cards.
- Active lesson "Acordes con séptima" (badge "Activa") shows its 4 exercises; exercises are visual only, no navigation.
- The "Inicio" bottom-nav item links back to `/pages/home.html`; "Ruta" is the active item.
- CSS-only interaction feedback (hover/press/focus-visible) was added across the screen by explicit approval — see Interaction Feedback Policy.

## 4. Interactive Exercise — completed

Files: `pages/interactive-exercise.html`, `css/interactive-exercise.css`

- Its "Finalizar ejercicio" button is currently inert (a plain `<button>`, no destination screen yet).
- Uses its own header pattern (back arrow + brand) instead of the Home/Learning Path top-bar (no avatar/bell).

## 5. Exercise Result — completed

Files: `pages/exercise-result.html`, `css/exercise-result.css` (no JavaScript)

- "Repetir ejercicio" links to `interactive-exercise.html`; "Siguiente ejercicio" and "Hablar con MusicAI" are inert (no destination screen yet).
- Bottom nav shows "Ruta" as the active item.

## 6. Challenges & Achievements (Desafíos y Logros) — completed

Files: `pages/challenges-achievements.html`, `css/challenges-achievements.css` (no JavaScript of its own)

- Built without a specific mockup, based on the navigation map (Pantalla 8: XP, achievements, streak, progress) plus the visual language already established in Login, Home, Learning Path, Interactive Exercise, Exercise Result and Assistant Panel.
- Uses its own module header (back button to `home.html` + title + subtitle) — NOT a copy of Exercise Result's header.
- The 65% progress ring is pure CSS (`conic-gradient`, no SVG/canvas).
- Active challenges, achievement grid and upcoming (locked) achievements are informational only — no navigation, no real logic.
- The 'Pedir consejo a MusicAI' chip reuses the existing Assistant Panel via `data-assistant-trigger` — no new JavaScript was needed.
- Bottom nav: 'Desafíos' is the active, inert item on this page (current screen); 'IA MusicAI' is already a `<button data-assistant-trigger>` here.

## 7. Community (Comunidad) — completed

Files: `pages/community.html`, `css/community.css` (no JavaScript of its own)

- Uses its own module header (back button to `home.html` + title + subtitle).
- Weekly ranking list, shared community challenges, practice partners, and community achievements are static/informational — no navigation, no real logic.
- The recommendation chip reuses the existing Assistant Panel via `data-assistant-trigger` — no new JavaScript was needed.
- Bottom nav: 'Comunidad' is the active, inert item on this page (current screen).

Two entry points exist by design, both documented in "Project Architecture (FROZEN)" above: the repository-root `index.html` (for GitHub Pages at the repo root URL) redirects to `02_Source/pages/login.html`; `02_Source/index.html` (for Live Server, and for GitHub Pages users who land directly on the `/02_Source/` path) redirects to `pages/login.html`. Both use relative paths. Do not remove either file, and do not convert these relative paths to absolute ones.

Currently active real navigation: Home ↔ Learning Path, and Interactive Exercise ↔ Exercise Result (via "Finalizar ejercicio" and "Repetir ejercicio"). "Desafíos" now links to `challenges-achievements.html` from Home, Learning Path, Interactive Exercise and Exercise Result. "Comunidad" now links to `community.html` from Home, Learning Path, Interactive Exercise, Exercise Result and Challenges & Achievements.

The Assistant Panel component now exists (`html/assistant-panel.html`, `css/assistant-panel.css`, `js/assistant-panel.js`). Once integrated on a page (see separate integration task), that page's "IA MusicAI" bottom-nav item opens it via `data-assistant-trigger` instead of staying inert.

---

# Canonical Bottom Navigation (FROZEN)

Official composition for the whole app:

1. Inicio
2. Ruta
3. IA MusicAI (highlighted center item)
4. Desafíos
5. Comunidad

Rules:

- Mockups showing a different composition (e.g. Progreso, Perfil) must NOT be followed. Flag them instead.
- The bottom nav markup is duplicated inline across pages on purpose (traceability). Do not extract it to `html/bottom-nav.html` without explicit authorization.
- Items become real links (`<a class="bottom-nav__link">`) only when their destination screen exists. Items without destination stay inert: no `<a>`, no `href`, no JavaScript navigation, no alerts, no toasts.
- The active item on each page uses `bottom-nav__item--active` and `aria-current="page"`.

---

# Header Convention (FROZEN)

Home uses the main app header (avatar, MusicAI logo, notifications bell). Secondary/internal screens use a "module header" pattern instead (back button + screen title/context, optional secondary action), NOT the Home-style header. No header partial exists yet; do not create one without explicit authorization.

---

# Reuse Architecture (FROZEN — 3 Levels)

1. **HTML partials** (`html/`): only for structural chrome repeated across screens (e.g. future `bottom-nav.html`). None exist yet; creating one requires explicit authorization.
2. **CSS component classes**: repeated visual patterns (cards, badges, list items) are shared classes, never HTML partials.
3. **JavaScript**: each page loads only what it truly needs. Shared JS only after real reuse is confirmed AND explicitly authorized.

`js/learning-path.js` is authorized: it reads a `?continue=1` query parameter to auto-expand the "Intermedio" level and the active lesson, and highlight the current exercise, for the "back to route" flow from Interactive Exercise.

## Accepted Duplication (do NOT "fix" without authorization)

- The `:root` palette is intentionally duplicated in `login.css`, `home.css` and `learning-path.css`.
- The bottom nav markup is intentionally duplicated in `home.html` and `learning-path.html`.
- Similar card styles may repeat until a shared CSS refactor is explicitly approved.

These refactors are already justified but not yet authorized. Never perform them automatically.

## Assistant Panel (transversal component)

- It is the first authorized HTML partial in `html/`: `assistant-panel.html`, paired with `css/assistant-panel.css` and `js/assistant-panel.js`.
- It is NOT an independent screen; it is a cross-screen bottom-sheet component (~56vh, slides up from the bottom, subtle overlay, current screen stays visible behind it).
- It is lazy-loaded via `fetch()` the first time a `[data-assistant-trigger]` element is clicked on any host page, then injected into `<body>`.
- `assistant-panel.css` intentionally does NOT redeclare the `:root` palette; it consumes host-page variables via `var(--name, fallback)`, relying on always being loaded alongside a screen's own CSS.
- The text input is real and typeable; the send button, mic button and suggestion chips are currently visual only (no message logic, no AI simulation).

---

# Interaction Feedback Policy (APPROVED)

To make the demo feel alive, CSS-only interaction feedback is approved app-wide, including on inert elements:

- Allowed states: `:hover`, `:active`, `:focus-visible` (focus-visible only on naturally focusable elements such as `<a>`, `<button>`, `<summary>`, inputs).
- Allowed properties: transform, color, border-color, box-shadow, opacity, background, with smooth transitions.
- Locked/disabled elements (e.g. locked levels, disabled buttons) keep deliberately minimal feedback (`cursor: not-allowed`, subtle opacity at most) so they still read as unavailable.
- Hard limit: feedback is VISUAL ONLY. Inert elements must never gain `href`, click handlers, JavaScript behavior, alerts or toasts. Navigation is activated only when the destination screen exists.
- Transitions must not fire on page load, only on interaction.

---

# Visual Rules

- Mobile-only. No tablet/desktop layouts, no extra media queries for other sizes.
- The prototype simulates a mobile app screen: content constrained by the `.app` container (`max-width: 430px`, centered) so it looks like a phone viewport even in a desktop browser.
- Dark theme, purple/blue gradients, musical decoration. Keep visual consistency with existing screens (reuse the same palette values).
- Icons: Unicode only. No new images, SVG files, icon fonts or external assets.

---

# Code Style

- Semantic HTML5: real `<form>`, `<nav>`, `<main>`, lists for lists, correct heading hierarchy, one purpose-driven `<h1>` per screen.
- Accessibility basics: labels tied to inputs, `aria-hidden="true"` on decorative elements, `role="alert"` for form errors, `.visually-hidden` utility when needed.
- Clean CSS organized in sections with header comments.
- JavaScript (only when needed): IIFE, `"use strict"`, no globals. No JS files for visual-only screens.
- Never: inline styles, inline JavaScript, frameworks, CDNs, external dependencies, build tools.

## Commenting Rule

All code must include didactic, beginner-friendly comments explaining what each important block does, why it exists, and any non-obvious decision. Do not comment obvious lines. Good comments explain intention, not noise.

---

# Development Workflow

1. Analyze the requested change or screen.
2. Detect inconsistencies against the navigation map, mockups and these rules.
3. Wait for approval if necessary.
4. Implement only what was requested.
5. Explain important implementation decisions.
6. Wait for review.

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
- Do not modify unrelated sections or "improve" code outside the requested scope.
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
- Modify previously approved architecture.
- Touch `index.html`, Login files, `.vscode/settings.json`, `.gitignore`, `README.md` or `CLAUDE.md` unless the prompt explicitly authorizes it.

If information is missing, ask. If a decision has not been approved, stop and wait.

---

# Priority

Current priority is development progress. Avoid unnecessary discussions or architectural redesigns unless a real technical blocker exists. Help move the project forward while respecting the approved architecture.
