# Parallel E2E Execution — EN

## Goal
Speed up runs while keeping tests deterministic.

## Strategy
Split suites:
- smoke (fast, stable)
- regression (slower)

Run smoke on every change (optional, depending on environment).

## Acceptance criteria
- documented split + how to run each suite
