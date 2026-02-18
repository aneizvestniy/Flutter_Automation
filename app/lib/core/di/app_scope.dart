import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/auth/data/in_memory_auth_repository.dart';
import '../../features/auth/domain/auth_repository.dart';
import '../../features/auth/presentation/auth_controller.dart';
import '../../features/notes/data/in_memory_notes_repository.dart';
import '../../features/notes/domain/notes_repository.dart';
import '../../features/notes/presentation/notes_controller.dart';

/// AppScope wires dependencies for the training application.
///
/// Why we do this:
/// - QA engineers need a predictable place to find "where services are created".
/// - tests need deterministic in-memory implementations.
/// - later, swapping to real API/local storage becomes a simple replacement.
///
/// NOTE: This is intentionally simple DI (using Provider) for teaching purposes.
class AppScope {
  static List<SingleChildWidget> providers() {
    final authRepo = InMemoryAuthRepository();
    final notesRepo = InMemoryNotesRepository();

    return [
      Provider<AuthRepository>.value(value: authRepo),
      Provider<NotesRepository>.value(value: notesRepo),

      // Controllers: ChangeNotifiers expose state for UI.
      ChangeNotifierProvider<AuthController>(
        create: (ctx) => AuthController(ctx.read<AuthRepository>()),
      ),
      ChangeNotifierProvider<NotesController>(
        create: (ctx) => NotesController(ctx.read<NotesRepository>()),
      ),
    ];
  }

  /// Whether debug-only tools are enabled.
  ///
  /// We use this flag to expose seed/reset actions ONLY in debug/profile.
  static bool get debugToolsEnabled => kDebugMode || kProfileMode;
}
