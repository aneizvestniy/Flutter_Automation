# Appium 2 + appium-flutter-driver setup (Android)

> This guide will be expanded with exact pinned versions and step-by-step screenshots.

## Prerequisites
- Node.js 22.x (`node -v`)
- Java 17 (Temurin)
- Android SDK (platform 34)
- Flutter SDK pinned via FVM (repo-level)

## Install Appium 2
```bash
npm i -g appium@2.11.4
appium -v
```

## Install the Flutter driver plugin
```bash
appium driver install flutter
appium driver list
```

## Start Appium server
```bash
appium --base-path /wd/hub
```

## Next
- Configure capabilities
- Connect to the Flutter context
- Use Flutter finders (`byValueKey`, `text`, `type`)
