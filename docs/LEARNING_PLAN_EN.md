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

## 1) Coverage Strategy (how we reach ~80%)

> Key point: in Flutter automation, 80% coverage is realistically achieved via **unit/widget/integration** tests for the app code, not only via Appium E2E.

### Approach
- **App coverage:** unit + widget + integration tests using Flutter test runner.
- **E2E (Appium):** fewer tests, focused on high-value end-to-end paths.
- **Test utilities package:** `packages/test_utils` with its own tests.

### Rules of thumb
- Every use case / repository / validator has unit tests.
- Every screen has at least one widget test covering key states (loading/error/success).
- Important integrations (local storage, API mock, etc.) are covered by integration tests.

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

---

## 3) Target Repository Structure

```text
Flutter_Automation/
  docs/
    LEARNING_PLAN_UA.md
    LEARNING_PLAN_EN.md
    module-01-dart-flutter-basics/
      README.md
      devtools-guide.md
      exercises/
        ex01_keys.md
        ex02_widget_tree.md
        ex03_state.md
      examples/
        keys_demo/
        widget_tree_demo/
        state_demo/
    module-02-training-app/
      README.md
      architecture.md
      troubleshooting.md
      exercises/
        ex01_run_app.md
        ex02_add_feature_flag.md
    module-03-test-framework/
      README.md
      appium-setup.md
      page-objects.md
      selectors-and-finders.md
      test-data-management.md
      troubleshooting.md
    module-04-advanced/
      README.md
      animations-and-sync.md
      parallel-execution.md
      ci-github-actions.md
      hybrid-apps.md
      performance.md
  app/
    pubspec.yaml
    lib/
      main.dart
      core/
      features/
    test/
    integration_test/
  packages/
    test_utils/
      pubspec.yaml
      lib/
      test/
  e2e/
    README.md
    appium/
      package.json
      src/
        config/
        drivers/
        pages/
        fixtures/
        tests/
    scripts/
      run_android_emulator.sh
      run_appium.sh
  .github/workflows/
    ci.yml
  .nvmrc
  fvm_config.json
  Makefile
  README.md
```

---

## 4) Implementation Sequence (4 weeks)

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

