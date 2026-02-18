# E2E Synchronization Standards (Appium + Flutter) — EN

## Why this matters
Most Flutter E2E flakiness comes from **timing**:
- animations
- async rebuilds
- navigation transitions
- network delays

The goal is to eliminate random `sleep()`.

---

## Golden rules
1) **No `sleep()` by default**.
   - If you must, wrap it in a single helper with a comment and a reason.
2) After every action (tap/type), wait for a **stable assertion**.
3) Prefer waiting for:
   - an element to appear
   - an element to disappear
   - a screen key to be visible
4) Use retries with small backoff over long fixed waits.

---

## What to wait for after common actions

### After tapping "Login"
Wait for one of:
- Notes list screen key is visible
- Error banner/snackbar key is visible

### After navigation
Wait for:
- target screen root key

### After save/delete
Wait for:
- snackbar key OR list updated assertion

---

## Implementation note
In this repo we will provide helpers:
- `waitForVisible(key)`
- `waitForGone(key)`
- `retry(action, assertion)`

These will be used by Page Objects.
