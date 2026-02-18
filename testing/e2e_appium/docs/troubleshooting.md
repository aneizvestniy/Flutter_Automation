# E2E Troubleshooting (Appium + Flutter) — EN

## Appium server won't start
- Check Appium version
- Ensure port is free

## Flutter driver not installed
```bash
appium driver list
appium driver install flutter
```

## Session starts but no elements found
- Ensure app is a debug build
- Ensure keys exist in UI (`AppKeys`)

## Flaky tests
- Follow sync standards:
  - `docs/synchronization.md`
- Avoid `sleep()`
- Add deterministic seed/reset
