# Training App — Troubleshooting (EN)

## Flutter / Android build issues

### `flutter doctor` shows Android toolchain issues
- Install Android Studio
- Install Android SDK platform 34
- Accept licenses:
```bash
sdkmanager --licenses
```

### Gradle errors
- Ensure Java 17 is used
- Re-run:
```bash
flutter clean
flutter pub get
flutter run
```

### `adb` can't see emulator/device
- Start emulator (AVD)
- Restart adb:
```bash
adb kill-server
adb start-server
adb devices
```

---

## Automation-specific issues

### Element not found
- Check that the widget has a `ValueKey` from `AppKeys`
- Confirm in DevTools Widget Inspector

### Flaky waits
- Follow sync rules: `testing/e2e_appium/docs/synchronization.md`
- Prefer stable assertions over sleeps
