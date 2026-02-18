/// state_demo.dart
///
/// Goal: demonstrate state changes and why E2E tests must wait for stability.
///
/// In real apps, state changes can be triggered by:
/// - button taps
/// - async operations (network)
/// - navigation
/// - streams / state management libraries
///
/// Tests become flaky when they:
/// - tap a button
/// - immediately assert without waiting for UI rebuild

import 'package:flutter/material.dart';

class StateDemoScreen extends StatefulWidget {
  const StateDemoScreen({super.key});

  @override
  State<StateDemoScreen> createState() => _StateDemoScreenState();
}

class _StateDemoScreenState extends State<StateDemoScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Count: $_count', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                // Pretend we do some async work.
                // This is where tests often become flaky.
                await Future<void>.delayed(const Duration(milliseconds: 250));

                // setState triggers a rebuild.
                setState(() {
                  _count++;
                });

                // After this, tests should assert on the new UI state.
                // Example stable assertion: text equals "Count: 1".
              },
              child: const Text('Increment (async)'),
            ),
          ],
        ),
      ),
    );
  }
}
