# Flutter Automation Learning Repository — Plan (EN)

This repository is a training project for QA engineers with **2+ years of testing experience** who are **new to Flutter/Dart**. The goal is to take learners from “Flutter zero” to their **first working E2E test by the end of week 2**, and by the end of week 4 deliver a complete set of runnable examples, CI, and **~80% coverage** across the training app + testing utilities.

---

## 0) Success Criteria (Definition of Done)

### By end of Week 2
- [ ] Learner can run the training Flutter app locally.
- [ ] Learner can set up Appium 2 + `appium-flutter-driver`.
- [ ] Learner writes and runs their **first E2E test** (login flow, 5–7 steps).

### By end of Week 4
- [ ] All 4 modules are complete and all examples are **runnable**.
- [ ] At least 1 full E2E scenario with **20+ steps**.
- [ ] CI (GitHub Actions) runs lint + unit/widget/integration tests and (optionally) e2e.
- [ ] Training examples reach ~**80% coverage** (on `app` + `test_utils`).

---

## 1) E2E vs Coverage — explicit separation (critical)

A common misunderstanding is: **"80% coverage = write many Appium E2E tests"**.
In Flutter projects, that is usually too slow, too flaky, and too expensive.

### Our rule
- **Coverage (~80%)** is achieved via **Flutter unit/widget/integration tests** (fast, stable).
- **E2E (Appium)** is for a *small number* of high-value user journeys (smoke/regression).

### Test types mapping
- **Unit tests** → domain logic (use cases), validation, mapping
- **Widget tests** → UI states and widget composition (loading/error/success)
- **Integration tests** → feature flows inside Flutter runtime
- **Appium E2E** → true end-to-end flows across screens + real device interactions

### Rules of thumb (to reach ~80%)
- Every use case / repository / validator has unit tests.
- Every screen has at least one widget test covering key states.
- Important integrations (local storage, networking mock) are covered by integration tests.

---

## 2) Tool Versions (pin these in the repo)

> Pinning avoids “works on my machine” issues.

- **Flutter SDK:** 3.24.3 (stable) *(or another pinned stable version via FVM)*
- **Dart:** 3.5.x (bundled with Flutter)
- **Appium:** 2.11.4
- **Node.js:** 22.x
- **Java (Android):** Temurin 17
- **Android SDK:** platform 34, build-tools 34.0.0
- **Xcode (optional):** 15.x

Suggested pin files: `.nvmrc` / `.tool-versions` + `fvm_config.json`.

### Week 0 / Day 1 preflight
Before Module 1, everyone must pass the preflight checklist:
- [`testing/PREFLIGHT_WEEK0_EN.md`](../testing/PREFLIGHT_WEEK0_EN.md)
- [`testing/PREFLIGHT_WEEK0_UA.md`](../testing/PREFLIGHT_WEEK0_UA.md)

---

## 3) Target Repository Structure

```text
Flutter_Automation/
  docs/                         # high-level docs (entry points)
    README.md
    LEARNING_PLAN_UA.md
    LEARNING_PLAN_EN.md

  learn/                        # learning modules (week-by-week)
    README.md
    module-01-dart-flutter-basics/
      README.md
      exercises/
      examples/
    module-02-training-app/
      README.md
      exercises/
    module-03-test-framework/
      README.md
    module-04-advanced/
      README.md

  app/                          # training Flutter app (Clean Architecture)
    README.md
    (generated Flutter project will live here)

  testing/                      # testing setup and frameworks
    README.md
    unit_widget_integration/
    e2e_appium/
      README.md
      package.json
      docs/
      src/
    ci/

  .github/workflows/
    ci.yml
  .nvmrc
  fvm_config.json
  Makefile
  README.md
```

---

## 4) Implementation Sequence (4 weeks)

### Added repo-level documents (supporting success criteria)
- Week 0 preflight:
  - `testing/PREFLIGHT_WEEK0_EN.md`
  - `testing/PREFLIGHT_WEEK0_UA.md`
- Seed/reset (test data management):
  - `testing/TEST_DATA_SEEDING_EN.md`
  - `testing/TEST_DATA_SEEDING_UA.md`
- E2E synchronization standards:
  - `testing/e2e_appium/docs/synchronization.md`
- CI split strategy (always vs optional):
  - `testing/CI_STRATEGY_EN.md`
  - `testing/CI_STRATEGY_UA.md`
- Week 2 E2E Definition of Ready:
  - `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`
  - `testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`
- Exit tickets per module:
  - `learn/module-01-dart-flutter-basics/EXIT_TICKET.md`
  - `learn/module-02-training-app/EXIT_TICKET.md`
  - `learn/module-03-test-framework/EXIT_TICKET.md`
  - `learn/module-04-advanced/EXIT_TICKET.md`

# MODULE 1 — Dart & Flutter Fundamentals (Week 1)

## Learning outcomes (measurable)
- [ ] Explain **Stateless vs Stateful** widgets.
- [ ] Explain **Widget Tree** and Flutter rendering basics.
- [ ] Use **Keys** (ValueKey) for stable test locators.
- [ ] Navigate Flutter DevTools (Widget Inspector) to locate UI elements.

## Folders/files to create
- `docs/module-01-dart-flutter-basics/README.md`
- `docs/module-01-dart-flutter-basics/devtools-guide.md`
- `docs/module-01-dart-flutter-basics/examples/*`
- `docs/module-01-dart-flutter-basics/exercises/*`

## Code examples (minimum)
1) **keys_demo**
   - A screen where critical elements have `ValueKey`.

2) **widget_tree_demo**
   - Nested layout showcasing Widget Tree.

3) **state_demo**
   - Counter app using StatefulWidget and setState.

## Practice exercises (for experienced QA)
- Add `ValueKey` to 10 UI elements and document naming rules.
- Use DevTools to locate 3 elements and describe their widget tree path.

## Common pitfalls & mitigation
- **Widget tree ≠ DOM**: explain “everything is a widget”.
- **No XPath**: teach stable strategy = **Keys** + `find.text/byType`.

## Key strategy (testability contract)
To keep locators stable and reduce flaky tests, the training app will maintain a centralized key registry:
- `app/lib/core/testing/keys.dart`

Rules:
- keys are constants (no ad-hoc strings in widgets)
- consistent naming: `screen.<screenName>.<element>`
- changing a key requires updating Page Objects and tests

---

# MODULE 2 — Training App (best practices) (Week 1–2)

## Learning outcomes
- [ ] Run the app locally (Android emulator / iOS simulator / desktop).
- [ ] Understand **Clean Architecture** layers (presentation/domain/data).
- [ ] Navigate routing & basic CRUD flows.

## App requirements
- Login screen.
- CRUD feature (Notes/Tasks): create/list/edit/delete.
- Navigation: login → list → details/edit → back.
- States: loading/error/empty/success.
- **ValueKey** for test-critical UI elements.

## Suggested code layout
```text
app/lib/
  core/
    widgets/
    theme/
    routing/
    errors/
  features/
    auth/
      presentation/
      domain/
      data/
    notes/
      presentation/
      domain/
      data/
```

## Documentation to add
- `docs/module-02-training-app/README.md` — dependencies + how to run.
- `docs/module-02-training-app/architecture.md` — Clean Architecture notes.
- `docs/module-02-training-app/troubleshooting.md` — common setup issues.

## Practice
- Add a new Notes field (e.g., `priority`) through all layers.
- Add a feature flag and verify UI behavior.

---

# MODULE 3 — Test Framework & First Tests (Week 2–3)

## Week 2 Definition of Ready
Before starting E2E, pass:
- `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`

## Sync standards
Follow:
- `testing/e2e_appium/docs/synchronization.md`

> Main milestone: **first E2E test by end of week 2**.

## Learning outcomes
- [ ] Install and configure Appium 2.
- [ ] Configure `appium-flutter-driver`.
- [ ] Use Flutter finders: `find.byValueKey`, `find.text`, `find.byType`.
- [ ] Apply Page Object Pattern.
- [ ] Write E2E tests: login + CRUD + full 20+ step scenario.

## E2E structure (example)
```text
e2e/appium/src/
  config/
    env.ts
    capabilities.android.ts
  drivers/
    appium.ts
  pages/
    login.page.ts
    notes.list.page.ts
    notes.editor.page.ts
  fixtures/
    users.ts
    notes.ts
  tests/
    01_login.spec.ts
    02_notes_crud.spec.ts
    99_full_e2e_20_steps.spec.ts
```

## Base tests to implement
- **Login flow (5–7 steps)**
- **CRUD flow**
- **20+ step full scenario** with detailed comments

## Typical challenges
- Sync: prefer explicit waits/retries over blind sleeps.
- Animations: use driver wait strategies / stable locators.

---

# MODULE 4 — Advanced Topics (Week 3–4)

## CI: always vs optional
Implement CI split described in:
- `testing/CI_STRATEGY_EN.md`

## Learning outcomes
- [ ] Stable synchronization for animations and delayed renders.
- [ ] Parallel test execution strategy.
- [ ] CI/CD with GitHub Actions.
- [ ] Basic performance checks (metrics, tools).
- [ ] Hybrid apps (WebView) concepts and testing strategy.

## Documentation
- `docs/module-04-advanced/animations-and-sync.md`
- `docs/module-04-advanced/parallel-execution.md`
- `docs/module-04-advanced/ci-github-actions.md`
- `docs/module-04-advanced/performance.md`

## Examples
- Retry wrappers for flaky locators.
- CI workflow covering lint + unit/widget/integration tests + coverage.
- Optional e2e job on self-hosted runner.

---

## 5) Root README requirements
- Quickstart (Flutter/FVM, Node, Appium).
- How to run app.
- How to run unit/widget/integration tests.
- How to run e2e.
- Troubleshooting.

---

## 6) Teaching notes for QA with 2+ years
- Use web analogies (DOM vs widget tree, locators vs keys).
- Provide copy-paste recipes (POM, fixtures, checklists).
- Avoid basic programming lectures; focus on practical patterns.

