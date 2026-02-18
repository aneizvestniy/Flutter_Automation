# Test Data Management — Seed/Reset Strategy (EN)

## Goal
Make E2E tests fast, repeatable, and non-flaky by ensuring a **predictable app state** at the start of each test.

In training repos, the biggest productivity killer is spending time creating data through UI over and over.

---

## Recommended approach (QA-friendly)
**In-memory repository + reset hook + debug-only actions**.

### Why this approach
- Works offline
- No external servers required
- Deterministic and fast
- Teaches testability best practices

---

## Design proposal for the training app

### 1) Runtime modes
- `debug` / `profile`: allow seeding/resetting data
- `release`: seeding/reset endpoints are disabled

### 2) Seed/Reset entry points (choose one)

#### Option A — Debug menu in UI (recommended for teaching)
Add a hidden "Debug" screen available only in debug builds:
- Reset app state
- Seed demo notes (N=3)
- Login as test user

Pros: very visible and easy to understand.
Cons: still UI interaction.

#### Option B — Deep link / route command (best for automation)
Expose a debug-only route:
- `/debug/reset`
- `/debug/seed?notes=3`

E2E can navigate directly to that route.

#### Option C — Platform channel command
Expose a method channel for "reset/seed".
Pros: powerful; Cons: more advanced.

---

## Minimal acceptance criteria (for Week 2 E2E)
- A single command exists to reset the app to a known state.
- A single command exists to create seed entities (e.g., 3 notes).
- The commands are only available in debug/profile.

---

## What to test
- Unit tests: seeding logic and mapping
- Widget tests: debug screen exists only in debug
- E2E: first step is always `reset + seed`
