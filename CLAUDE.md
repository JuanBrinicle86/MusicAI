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

## Project Owner

Integrates files, tests visually in Live Server, reviews results, approves changes and decides when to commit.

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

Therefore all internal references use clean absolute paths: `/css/...`, `/js/...`, `/pages/...`, `/html/...`, `/assets/...`. Never "fix" absolute paths into relative ones.

Structure:

```text
02_Source/
├── assets/          # application resources only (images/, icons/, fonts/)
├── css/             # stylesheets
├── html/            # reusable partials only (currently empty on purpose)
├── js/              # application JavaScript
├── pages/           # complete pages only (flat, no module subfolders yet)
└── index.html       # single entry point; only redirects to /pages/login.html
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

All three screens below are COMPLETED, integrated in the repository and verified.

## 1. Login — completed

Files: `pages/login.html`, `css/login.css`, `js/login.js`

- Local simulated validation against hardcoded test user: `test@musicai.com` / `MusicAI123`.
- Valid credentials redirect to `/pages/home.html`; invalid show an inline error (`role="alert"`).
- Google/Apple buttons and secondary links are visual only.

## 2. Home — completed

Files: `pages/home.html`, `css/home.css` (no `home.js` by decision; visual-only screen)

- The literal value `13:31` in the progress card stays exactly as-is (no label, no interpretation).
- The "Ruta" bottom-nav item is a real link to `/pages/learning-path.html`.

## 3. Learning Path (Ruta) — completed

Files: `pages/learning-path.html`, `css/learning-path.css` (no JavaScript)

- Level → Lesson → Exercise hierarchy built with native `<details>/<summary>` (no JS).
- Only "Intermedio" is expanded; `Básico`/`Elemental` are completed static cards; `Avanzado`/`Experto` are locked static cards.
- Active lesson "Acordes con séptima" (badge "Activa") shows its 4 exercises; exercises are visual only, no navigation.
- The "Inicio" bottom-nav item links back to `/pages/home.html`; "Ruta" is the active item.
- CSS-only interaction feedback (hover/press/focus-visible) was added across the screen by explicit approval — see Interaction Feedback Policy.

Entry point: `index.html` → `/pages/login.html`.

Currently active real navigation: Home ↔ Learning Path.

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

# Reuse Architecture (FROZEN — 3 Levels)

1. **HTML partials** (`html/`): only for structural chrome repeated across screens (e.g. future `bottom-nav.html`). None exist yet; creating one requires explicit authorization.
2. **CSS component classes**: repeated visual patterns (cards, badges, list items) are shared classes, never HTML partials.
3. **JavaScript**: each page loads only what it truly needs. Shared JS only after real reuse is confirmed AND explicitly authorized.

## Accepted Duplication (do NOT "fix" without authorization)

- The `:root` palette is intentionally duplicated in `login.css`, `home.css` and `learning-path.css`.
- The bottom nav markup is intentionally duplicated in `home.html` and `learning-path.html`.
- Similar card styles may repeat until a shared CSS refactor is explicitly approved.

These refactors are already justified but not yet authorized. Never perform them automatically.

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
