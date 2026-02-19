# Flutter_Automation

Training repository for **Flutter/Dart test automation**.

**Target audience:** QA engineers with **2+ years** of testing experience who are new to the Flutter ecosystem.

## What you get
- A **training Flutter app** (`app/`) built to be automation-friendly:
  - Login + Notes CRUD
  - deterministic UI selectors via `ValueKey`
  - debug-only seed/reset utilities to keep E2E deterministic
- A structured learning track (`learn/`) with:
  - measurable outcomes
  - exercises (hands-on tasks)
  - exit tickets (clear completion criteria)
- A testing workspace (`testing/`) with:
  - preflight setup checklist
  - E2E framework scaffold for **Appium + appium-flutter-driver**
  - CI strategy (always vs optional)
- High-level docs (`docs/`) with a one-page roadmap and detailed plan.

---

## Quick links (start here)
- **Docs entry point:** [`docs/README.md`](./docs/README.md)
- **Roadmap (one page):** [`docs/ROADMAP.md`](./docs/ROADMAP.md)
- **Learning plan (EN):** [`docs/LEARNING_PLAN_EN.md`](./docs/LEARNING_PLAN_EN.md)
- **Learning plan (UA):** [`docs/LEARNING_PLAN_UA.md`](./docs/LEARNING_PLAN_UA.md)

---

## Repository structure
```text
Flutter_Automation/
  docs/       # entry docs: roadmap + plan
  learn/      # learning modules + exercises
  app/        # training Flutter application (code)
  testing/    # testing setup (unit/widget/integration + E2E Appium)
```

---

## Preflight (environment readiness)
Before doing anything else, run the preflight checklist:
- EN: [`testing/PREFLIGHT_WEEK0_EN.md`](./testing/PREFLIGHT_WEEK0_EN.md)
- UA: [`testing/PREFLIGHT_WEEK0_UA.md`](./testing/PREFLIGHT_WEEK0_UA.md)

This prevents losing days to Android SDK / emulator / Java issues.

---

## Run the training app
> The app lives in `app/`.

```bash
cd app
flutter pub get
flutter run
```

### Training credentials
- **email:** `qa@example.com`
- **password:** `Password123!`

---

## Run tests (fast, reliable)
> Coverage is achieved primarily via Flutter tests (unit + widget + integration), not Appium.

```bash
cd app
flutter test
```

---

## E2E (Appium) — important note about KVM
The E2E framework scaffold is under:
- `testing/e2e_appium/`

However, **Android emulators are realistically runnable only on hosts with KVM** (`/dev/kvm`).
If your machine/VM does not have KVM, the emulator will be extremely slow or may fail to boot.

See:
- E2E readiness: [`testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`](./testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md)
- Sync standards: [`testing/e2e_appium/docs/synchronization.md`](./testing/e2e_appium/docs/synchronization.md)

---

## CI
GitHub Actions workflow:
- `.github/workflows/ci.yml`

Design:
- **Always:** lint + flutter tests (GitHub-hosted runner)
- **Optional:** Appium E2E (self-hosted runner with KVM/emulator)

See:
- EN: [`testing/CI_STRATEGY_EN.md`](./testing/CI_STRATEGY_EN.md)
- UA: [`testing/CI_STRATEGY_UA.md`](./testing/CI_STRATEGY_UA.md)

---

## Contributing / next steps
Typical next improvements:
- expand unit/widget tests to increase coverage
- add integration tests for longer flows
- implement a runnable Appium E2E suite on a KVM-capable host

