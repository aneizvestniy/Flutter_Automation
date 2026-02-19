# Flutter Automation Learning Repository — Structured Plan (EN)

This repository is designed for QA engineers with **2+ years of testing experience** who are **new to Flutter/Dart**.

## Primary outcomes
- Learners can write and run their **first E2E test** (Appium + appium-flutter-driver) early in the learning path.
- The repository provides runnable examples and a structure that can reach **~80% coverage** on the **training app + test utilities** (primarily via unit/widget/integration tests).

---

# 0) How to use this plan
This plan is organized by **implementation points** (not by weeks). You can execute them sequentially.

Repository folders:
- `learn/` — learning modules and exercises
- `app/` — the training Flutter application
- `testing/` — test strategy + E2E framework + CI
- `docs/` — high-level entry documents

---

# 1) E2E vs Coverage (explicit separation)
A common misconception is: **"80% coverage = lots of Appium E2E"**.

## 1.1 Rule
- **Coverage (~80%)** is achieved via **Flutter unit/widget/integration tests**.
- **Appium E2E** is kept small and focused on critical user journeys.

## 1.2 Test types mapping (what covers what)
- **Unit tests** → domain logic (use cases), validation, mapping
- **Widget tests** → UI states and widget composition (loading/error/success)
- **Integration tests** → feature flows inside Flutter runtime
- **Appium E2E** → end-to-end smoke/regression across screens + device interactions

Artifacts:
- (plan) `docs/LEARNING_PLAN_EN.md`

---

# 2) Environment readiness (Preflight)
The #1 cause of lost time for QA engineers new to Flutter is environment setup.

## 2.1 Preflight checklist
- `testing/PREFLIGHT_WEEK0_EN.md`
- `testing/PREFLIGHT_WEEK0_UA.md`

## 2.2 Pinned toolchain versions (recommended)
- Flutter SDK: **3.24.3** (stable) via FVM
- Appium: **3.0.0**
- Node: **22.x**
- Java: **Temurin 17**
- Android SDK: platform **34**, build-tools **34.0.0**

Artifacts:
- (docs) preflight files above
- (repo) `.nvmrc`, `fvm_config.json` (to be added when toolchain is pinned in code)

---

# 3) Training app architecture & testability contract
The training app must be intentionally testable.

## 3.1 Clean Architecture layout
- presentation / domain / data
- features are separated and discoverable for newcomers

## 3.2 Key strategy (testability contract)
Stable locators in Flutter come from `ValueKey`.

Rules:
- keys are centralized (no ad-hoc strings)
- naming is stable: `screen.<screenName>.<element>`

Artifacts:
- `app/lib/core/testing/keys.dart`

## 3.3 Minimal key set (must-have)
- Login: email/password/submit
- CRUD: create/list item/editor/save/delete

Artifacts:
- keys added into `AppKeys` and used in widgets

---

# 4) Learning modules (content for QA engineers)
Modules live in `learn/` and contain:
- README with outcomes
- exercises with acceptance criteria
- exit tickets (measurable completion)

Artifacts:
- `learn/module-01-dart-flutter-basics/*`
- `learn/module-02-training-app/*`
- `learn/module-03-test-framework/*`
- `learn/module-04-advanced/*`

---

# 5) Test data management (seed/reset)
E2E tests must start from a predictable state.

## 5.1 Recommended approach
**In-memory repository + reset hook + debug-only actions**.

## 5.2 Entry point options
- Debug menu (teaching-friendly)
- Deep-link/route commands (automation-friendly)
- Method channel (advanced)

Artifacts:
- `testing/TEST_DATA_SEEDING_EN.md`
- `testing/TEST_DATA_SEEDING_UA.md`

---

# 6) E2E framework (Appium + appium-flutter-driver)
E2E lives under:
- `testing/e2e_appium/`

## 6.1 What we build
- Appium setup docs
- capabilities config
- Page Objects
- fixtures (test users, seeded entities)
- test suites: login, CRUD, 20+ steps scenario

Artifacts:
- `testing/e2e_appium/README.md`
- `testing/e2e_appium/docs/appium-setup.md`

---

# 7) E2E stability standards (synchronization)
Flakiness comes from timing (animations, async rebuilds, navigation).

Rules:
- no raw `sleep()` by default
- after each action: wait for a stable assertion
- retries with small backoff over long fixed waits

Artifacts:
- `testing/e2e_appium/docs/synchronization.md`

---

# 8) CI strategy (always vs optional)
CI must be green by default.

## 8.1 Always pipeline
- format/lint
- unit/widget tests
- coverage + threshold

## 8.2 Optional pipeline
- Appium E2E on self-hosted runner

Artifacts:
- `testing/CI_STRATEGY_EN.md`
- `testing/CI_STRATEGY_UA.md`

---

# 9) Definition of Ready (DoR) for first E2E
Before writing the first Appium E2E test, ensure:
- minimal keys implemented
- test user exists
- seed/reset exists
- debug build is available
- emulator/device is ready

Artifacts:
- `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`
- `testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`

---

# 10) Measurable completion (Exit tickets)
Each learning module has an exit ticket.

Artifacts:
- `learn/module-01-dart-flutter-basics/EXIT_TICKET.md`
- `learn/module-02-training-app/EXIT_TICKET.md`
- `learn/module-03-test-framework/EXIT_TICKET.md`
- `learn/module-04-advanced/EXIT_TICKET.md`
