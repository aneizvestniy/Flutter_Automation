/// widget_tree_demo.dart
///
/// Goal: show how Flutter UI is composed as a tree of widgets.
///
/// For QA engineers:
/// - There is no HTML/DOM.
/// - UI = nested widgets.
/// - DevTools Widget Inspector is how you "see" the structure.

import 'package:flutter/material.dart';

class WidgetTreeDemoScreen extends StatelessWidget {
  const WidgetTreeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Tree Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Think of this as a container on the page.
            // But it is not HTML, it's just a widget.
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Section title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('This is a nested Text widget.'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: null,
                    child: Text('Disabled'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton(
                    onPressed: null,
                    child: Text('Also disabled'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
