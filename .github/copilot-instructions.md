MusicAI is a SENA ADSO educational prototype for learning Functional Harmony applied to Guitar. The current repository is a static, simulated prototype for UX and functional validation, not the production Flutter/Dart + Python/FastAPI architecture.

The canonical MVP scope is closed at R01–R40. The approved source for UX, navigation and revoked decisions is 00_Documentation/requirements/functional-baseline-v3.md, and the approved navigation reference is 00_Documentation/site-map/site-map-v2.png.

Before proposing or making any change, inspect the real repository evidence. Human in the loop: JuanC approves everything and controls repository state.

Never perform Git operations.
Modify only the files authorized by the current Task Contract.
No scope expansion; no functionality added by inference.
No new dependencies without approval.
No speculative refactors, abstractions or shared components; do not create new files unless explicitly authorized by the current Task Contract.
The prototype uses HTML5, CSS3 and Vanilla JavaScript only.
All prototype behavior is simulated: no backend, API, database, real authentication, real AI or real DSP.
The prototype is not the production architecture and must not be prepared to become one.

Focus Mode invariant: during active execution of an Interactive Exercise, the global header and bottom navigation are hidden; only exercise-specific controls remain. No access to MusicAI Assistant, Profile, Notifications, Tuner, Challenges or Community while active.

Domain invariants: academic progress ≠ total XP; total XP ≠ weekly XP; streak ≠ academic progress; Challenges ≠ Community shared challenges; Achievements ≠ special rewards; Library ≠ contextual memory; restart attempt ≠ repeat exercise; personal profile ≠ community profile; notification received ≠ action executed; selected target string ≠ detected note.

Stop and report contradictions, missing information or anything requiring reinterpretation of a requirement.
The active role and task scope come from the Task Contract, not from this file.
