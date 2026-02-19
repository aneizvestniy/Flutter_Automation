# Coverage Plan (EN)

## Goal
Reach ~80% coverage primarily via **unit + widget + integration** tests.

## Why not Appium for coverage
Appium E2E is slower and tends to be flaky. It is used for critical flows, not for broad coverage.

## Current state
- We have unit tests for in-memory repositories.
- We have a widget-level flow test (login + create note).

## Next steps
1) Add more unit tests for:
   - controller state transitions
   - validation edge cases
2) Add widget tests for:
   - empty state
   - error state
3) Add integration tests (optional) for longer flows.

## Commands
From `app/`:
```bash
flutter test
# Later:
# flutter test --coverage
# genhtml coverage/lcov.info -o coverage/html
```
