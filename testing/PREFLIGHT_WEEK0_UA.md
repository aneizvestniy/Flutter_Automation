# Week 0 / Day 1 — Preflight чекліст (UA)

## Ціль
Швидко привести всіх до стану "готовий навчатися", щоб не втрачати Тиждень 1 на налаштування SDK.

**Орієнтовний час:** 60–120 хв.

---

## 1) Очікувані версії (мають збігатися в команді)
- Node.js: **22.x**
- Java: **Temurin 17**
- Flutter: зафіксований через **FVM** (версія в репозиторії)
- Android SDK: platform **34**, build-tools **34.0.0**
- Appium: **2.11.4**

---

## 2) Перевірка Flutter
Запусти:
```bash
flutter doctor -v
```

**Критерій приймання:** немає критичних помилок для:
- Flutter SDK
- Android toolchain (SDK, licenses)
- Є доступний девайс/емулятор

---

## 3) Перевірка Android emulator/device
Запусти:
```bash
adb devices
```

**Критерій приймання:** хоча б 1 девайс має статус `device`.

Якщо потрібен емулятор:
- створи AVD в Android Studio (AVD Manager)
- запусти его і знову перевір `adb devices`

---

## 4) Перевірка репозиторію
З кореня репо:
```bash
cd app
# пізніше, коли згенеруємо Flutter-проєкт
flutter pub get
flutter test
```

---

## 5) Типові проблеми (швидкі фікси)
### Android licenses
```bash
sdkmanager --licenses
```

### adb не знайдено
Переконайся, що встановлений `platform-tools` і він у PATH.

### Gradle помилки
- використовуй Java 17
- повтори `flutter doctor -v`

---

## Exit ticket
Скинь в PR / в чат навчання:
- короткий підсумок `flutter doctor -v` (тільки рядки з issues)
- вивід `adb devices`
