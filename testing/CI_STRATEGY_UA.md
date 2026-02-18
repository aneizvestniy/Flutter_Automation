# CI стратегія (UA)

## Ціль
Репозиторій має бути **зеленим "з коробки"** на GitHub-hosted runner.

Оскільки mobile E2E потребує emulator/реальний девайс, CI ділимо на:

### Always (завжди на кожен PR)
- formatting / lint
- Flutter unit тести
- Flutter widget тести
- Flutter integration тести (якщо можуть бігати headless)
- coverage report + перевірка порогу

### Optional (за потреби)
- Appium E2E (потрібен emulator або девайс)
- запускається на **self-hosted runner** або окремому середовищі

---

## Чому так
- менше флейків через підняття емулятора
- легше онбординг
- quality gates (lint + coverage) все одно є
