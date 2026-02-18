# Roadmap (one page)

This is a short, execution-oriented roadmap. For full details, see:
- [Learning Plan (EN)](./LEARNING_PLAN_EN.md)
- [Learning Plan (UA)](./LEARNING_PLAN_UA.md)

---

## 1) Preflight (environment readiness)
Goal: avoid losing days to SDK/tooling setup.
- Preflight checklist:
  - [`../testing/PREFLIGHT_WEEK0_EN.md`](../testing/PREFLIGHT_WEEK0_EN.md)
  - [`../testing/PREFLIGHT_WEEK0_UA.md`](../testing/PREFLIGHT_WEEK0_UA.md)

Done when:
- `flutter doctor -v` has no critical issues
- `adb devices` shows at least one device/emulator

---

## 2) Training app testability contract (Keys)
Goal: make locators stable and automation-friendly.
- Key registry: [`../app/lib/core/testing/keys.dart`](../app/lib/core/testing/keys.dart)

Done when:
- minimal keys exist for login + CRUD
- widgets use `AppKeys.*` (no ad-hoc strings)

---

## 3) Training app skeleton (Clean Architecture)
Goal: a small but realistic app (login + CRUD) with predictable UI states.

Done when:
- app runs locally
- login flow works
- CRUD works (create/list/edit/delete)
- loading/error/empty/success states exist

---

## 4) Seed/reset strategy (test data management)
Goal: E2E tests always start from a predictable state.
- Strategy:
  - [`../testing/TEST_DATA_SEEDING_EN.md`](../testing/TEST_DATA_SEEDING_EN.md)
  - [`../testing/TEST_DATA_SEEDING_UA.md`](../testing/TEST_DATA_SEEDING_UA.md)

Done when:
- debug-only reset + seed entry point exists
- E2E can call reset+seed as the first step

---

## 5) E2E framework (Appium)
Goal: first runnable E2E test.
- E2E scaffold: [`../testing/e2e_appium/README.md`](../testing/e2e_appium/README.md)

Definition of Ready:
- [`../testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`](../testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md)
- [`../testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md`](../testing/E2E_WEEK2_DEFINITION_OF_READY_UA.md)

Sync standards:
- [`../testing/e2e_appium/docs/synchronization.md`](../testing/e2e_appium/docs/synchronization.md)

Done when:
- login E2E (5–7 steps) runs reliably

---

## 6) Coverage path (~80%)
Goal: reach ~80% coverage via fast tests.

Done when:
- unit + widget + integration tests exist for key parts
- CI enforces a coverage threshold

---

## 7) CI strategy
Goal: repo is green by default.
- Always vs optional:
  - [`../testing/CI_STRATEGY_EN.md`](../testing/CI_STRATEGY_EN.md)
  - [`../testing/CI_STRATEGY_UA.md`](../testing/CI_STRATEGY_UA.md)

Done when:
- always pipeline runs on GitHub-hosted runners
- optional pipeline exists for Appium E2E (self-hosted)
