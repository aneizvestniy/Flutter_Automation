# Animations & Synchronization — EN

## Problem
Animations and async rebuilds cause flaky tests.

## Rule
After actions, wait for **stable signals**:
- screen root key visible
- spinner gone
- snackbar appears

## Repo standard
- `testing/e2e_appium/docs/synchronization.md`

## Acceptance criteria
- Learner replaces sleeps with stable waits
