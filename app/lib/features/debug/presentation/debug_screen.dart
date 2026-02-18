import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/di/app_scope.dart';
import '../../auth/data/in_memory_auth_repository.dart';
import '../../auth/domain/auth_repository.dart';
import '../../notes/domain/notes_repository.dart';
import '../../notes/presentation/notes_controller.dart';

/// DebugScreen provides seed/reset utilities for deterministic testing.
///
/// IMPORTANT:
/// - This screen must NOT be available in release mode.
/// - For teaching, it's okay to expose it in debug/profile.
///
/// The docs describing this strategy:
/// - `testing/TEST_DATA_SEEDING_EN.md`
/// - `testing/TEST_DATA_SEEDING_UA.md`
class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  static bool get isEnabled => AppScope.debugToolsEnabled;

  @override
  Widget build(BuildContext context) {
    final notesRepo = context.read<NotesRepository>();

    return Scaffold(
      appBar: AppBar(title: const Text('Debug tools')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'These tools are enabled only in debug/profile builds.\n'
              'They exist to make E2E tests deterministic.',
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () async {
                await notesRepo.reset();
                await context.read<NotesController>().load();
                if (!context.mounted) return;
                _snack(context, 'Notes reset');
              },
              child: const Text('Reset notes'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                await notesRepo.seedDemo(count: 3);
                await context.read<NotesController>().load();
                if (!context.mounted) return;
                _snack(context, 'Seeded 3 notes');
              },
              child: const Text('Seed 3 notes'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Reset auth by accessing concrete repo in training only.
                // In production you would expose this via interface.
                final authRepo = context.read<AuthRepository>() as InMemoryAuthRepository;
                authRepo.reset();
                _snack(context, 'Auth reset');
              },
              child: const Text('Reset auth'),
            ),
          ],
        ),
      ),
    );
  }

  void _snack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
