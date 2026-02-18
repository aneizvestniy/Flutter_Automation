# CI Strategy (EN)

## Goal
Keep the repository **green by default** on GitHub-hosted runners.

Because mobile E2E needs emulators/real devices, we split CI into:

### Always (runs on every PR)
- formatting / lint
- Flutter unit tests
- Flutter widget tests
- Flutter integration tests (if they can run headless)
- coverage report + threshold check

### Optional (runs on demand)
- Appium E2E (requires emulator or device)
- runs on **self-hosted runner** or a dedicated environment

---

## Why this split
- avoids flaky CI due to emulator startup
- makes onboarding easier
- still keeps quality gates (lint + coverage)
