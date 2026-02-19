# Week 0 / Day 1 — Preflight Checklist (EN)

## Goal
Get everyone to a "ready to learn" state **fast**. This avoids spending Week 1 debugging SDKs.

**Target time:** 60–120 minutes.

---

## 1) Environment versions (expected)
- Node.js: **22.x**
- Java: **Temurin 17**
- Flutter: pinned via **FVM** (repo version)
- Android SDK: platform **34**, build-tools **34.0.0**
- Appium: **3.0.0**

---

## 2) Flutter sanity check
Run:
```bash
flutter doctor -v
```

**Acceptance criteria:** no critical errors for:
- Flutter (SDK OK)
- Android toolchain (SDK, licenses)
- Connected device/emulator available

---

## 3) Android emulator/device check
Run:
```bash
adb devices
```

**Acceptance criteria:** at least 1 device listed as `device`.

If emulator is needed:
- Create an emulator in Android Studio (AVD Manager)
- Start it and re-run `adb devices`

---

## 4) Repo quick check
From repo root:
```bash
cd app
# later, once Flutter project is generated
flutter pub get
flutter test
```

---

## 5) Common failures (quick fixes)
### Licenses
```bash
sdkmanager --licenses
```

### adb not found
Ensure `platform-tools` is installed and in PATH.

### Gradle sync errors
- Use Java 17
- Re-run `flutter doctor -v`

---

## Exit ticket
Paste into your PR / training chat:
- `flutter doctor -v` summary (only the lines with issues)
- `adb devices` output
