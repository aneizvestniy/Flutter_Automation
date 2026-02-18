# Flutter Finders (Appium Flutter Driver) — EN

## Why finders are different from Web locators
There is no DOM.

The most stable strategy:
1) **ValueKey** (preferred)
2) `text`
3) `type` (last resort)

---

## byValueKey
Use when the app provides `ValueKey`.

Example key naming convention:
- `screen.login.email`
- `screen.notes.create`

In training app, keys are centralized:
- `app/lib/core/testing/keys.dart`

---

## text
Use for stable visible labels.
Be careful with:
- localization
- dynamic content

---

## type
Use rarely because:
- multiple widgets share the same type
- refactors break tests

---

## Acceptance criteria
- Learner can explain why keys are preferred
- Learner can build a Page Object locator using keys
