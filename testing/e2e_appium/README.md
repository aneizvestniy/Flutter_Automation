# E2E (Appium) — Flutter Automation

## Goal
Run E2E tests against the training Flutter app using **Appium 2** and **appium-flutter-driver**.

## Folder structure
```text
testing/e2e_appium/
  package.json
  docs/
    appium-setup.md
    capabilities.md
    finders.md
    page-objects.md
    troubleshooting.md
  src/
    config/
    driver/
    pages/
    fixtures/
    tests/
```

## Quick start (outline)
1) Start emulator/device
2) Start Appium server
3) Run the test suite

> This is a scaffold. Next steps:
> - implement seed/reset strategy: `testing/TEST_DATA_SEEDING_EN.md`
> - follow sync standards: `testing/e2e_appium/docs/synchronization.md`
> - ensure Week2 readiness: `testing/E2E_WEEK2_DEFINITION_OF_READY_EN.md`
