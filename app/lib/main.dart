import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/di/app_scope.dart';
import 'core/routing/routes.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/debug/presentation/debug_screen.dart';
import 'features/notes/presentation/note_editor_screen.dart';
import 'features/notes/presentation/notes_list_screen.dart';

/// Training App entry point.
///
/// Goals of the app:
/// - be small but realistic: Login + CRUD
/// - demonstrate Clean Architecture structure
/// - be intentionally testable: keys, deterministic states, seed/reset
void main() {
  runApp(const TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppScope.providers(),
      child: MaterialApp(
        title: 'Flutter Automation Training App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: Routes.login,
        routes: {
          Routes.login: (ctx) => const LoginScreen(),
          Routes.notes: (ctx) => const NotesListScreen(),
          Routes.noteEditor: (ctx) {
            final noteId = ModalRoute.of(ctx)?.settings.arguments as String?;
            return NoteEditorScreen(noteId: noteId);
          },
          Routes.debug: (ctx) {
            // Safety: do not allow debug tools in release.
            if (!DebugScreen.isEnabled) {
              return const Scaffold(
                body: Center(child: Text('Debug tools are disabled in release.')),
              );
            }
            return const DebugScreen();
          },
        },
      ),
    );
  }
}
