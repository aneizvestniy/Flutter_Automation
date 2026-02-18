# CI/CD with GitHub Actions — EN

## Principle
CI should be **green by default**.

Therefore we split:
- ALWAYS: lint + unit/widget/integration + coverage
- OPTIONAL: Appium E2E (self-hosted)

See:
- `testing/CI_STRATEGY_EN.md`

## What we will implement
- `.github/workflows/ci.yml` for Flutter checks and coverage threshold
- optional workflow for E2E

## Acceptance criteria
- PR runs always pipeline
- coverage threshold enforced
