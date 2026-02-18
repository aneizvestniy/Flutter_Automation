# Page Object Pattern (POM) — EN

## Goal
Make E2E tests readable and maintainable.

## Rules
- One Page Object per screen.
- Page Object methods must:
  - perform an action
  - wait for a stable post-condition

## Example structure
```text
src/pages/
  login.page.mjs
  notes.list.page.mjs
  note.editor.page.mjs
```

## What goes into Page Objects
- selectors/finders
- actions (tap/type)
- waits/assertions (screen visible)

## What should NOT be in Page Objects
- test scenario logic (belongs in spec files)

## Acceptance criteria
- No raw selectors in tests
- Tests read like a business flow
