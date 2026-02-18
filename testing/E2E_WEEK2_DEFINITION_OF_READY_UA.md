# Week 2 — E2E Definition of Ready (UA)

Перед тим як писати перший Appium E2E тест, перевір:

## Готовність апки
- [ ] Мінімальний набір `ValueKey` реалізований (login + CRUD критичні елементи)
- [ ] Є реєстр ключів: `app/lib/core/testing/keys.dart`
- [ ] Є test user креденшали (описані в доках)
- [ ] Є seed/reset механізм (тільки debug)
- [ ] Є debug APK (або апку можна запускати через Appium)

## Готовність девайса
- [ ] Запущений Android emulator/девайс
- [ ] `adb devices` показує девайс як `device`

## Готовність тулінгу
- [ ] Appium 2 встановлено (зафіксована версія)
- [ ] `appium-flutter-driver` встановлено
- [ ] Appium сервер стартує

## Exit ticket
Скинь підтвердження:
- `adb devices`
- `appium driver list`
- лінк на PR з мінімальними keys + seed/reset
