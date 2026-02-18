# Week 2 — E2E Definition of Ready (EN)

Before writing the first Appium E2E test, ensure:

## App readiness
- [ ] Minimal `ValueKey` set is implemented (login + CRUD critical elements)
- [ ] Key registry exists: `app/lib/core/testing/keys.dart`
- [ ] Test user credentials are defined and documented
- [ ] Seed/reset mechanism exists (debug-only)
- [ ] Debug build artifact is available (APK) OR the app can be launched by Appium

## Device readiness
- [ ] Android emulator/device is running
- [ ] `adb devices` shows device as `device`

## Tooling readiness
- [ ] Appium 2 installed (pinned version)
- [ ] `appium-flutter-driver` installed
- [ ] Appium server can start

## Exit ticket
Paste proof:
- `adb devices`
- `appium driver list`
- link to PR that adds minimal keys + seed/reset
