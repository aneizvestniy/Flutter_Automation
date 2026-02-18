# Exercise 03 — State & synchronization basics

## Goal
Understand why UI state changes (setState, streams, async) create flaky tests if you don't wait for stability.

## Task
1) Identify 3 UI states in the training app (Module 2):
   - Loading
   - Error
   - Success
2) For each state:
   - specify what triggers it (API call, validation, navigation)
   - define what a *stable* assertion looks like (e.g., "Save button disabled", "Spinner is gone")

## Acceptance criteria
- You can describe a waiting strategy that avoids `sleep()`.
- You can explain what you need to wait for after tapping a button.
