/// keys_demo.dart
///
/// Goal: demonstrate why QA-friendly Flutter apps should use `ValueKey`.
///
/// In Web testing, we often rely on stable CSS selectors / test IDs.
/// In Flutter, the equivalent is usually `ValueKey`.
///
/// Important:
/// - Keys are not visible to users.
/// - Keys are visible to automation (Flutter finders and Appium Flutter driver).
/// - Keys must be stable and consistent.
///
/// This file is a reference snippet. The training app will use the same idea,
/// but keys will be centralized in `app/lib/core/testing/keys.dart`.

import 'package:flutter/material.dart';

class KeysDemoScreen extends StatelessWidget {
  const KeysDemoScreen({super.key});

  // For small demos it's fine to define keys inline,
  // but in production/training apps you should NOT do that.
  // Instead, centralize them as constants.
  static const emailKey = ValueKey<String>('screen.keysDemo.email');
  static const submitKey = ValueKey<String>('screen.keysDemo.submit');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keys Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              key: emailKey,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              key: submitKey,
              onPressed: () {
                // In automation, after tapping we need a stable assertion.
                // Here we show a SnackBar as a deterministic outcome.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Submitted')),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
