import 'package:flutter_test/flutter_test.dart';
import 'package:training_app/core/testing/keys.dart';
import 'package:training_app/main.dart';

void main() {
  testWidgets('login and create note (widget-level flow)', (WidgetTester tester) async {
    await tester.pumpWidget(const TrainingApp());
    await tester.pumpAndSettle();

    // Tap login.
    await tester.tap(find.byKey(AppKeys.screenLoginSubmit));

    // Wait for async login + navigation.
    await tester.pumpAndSettle();

    // On Notes screen, tap create.
    await tester.tap(find.byKey(AppKeys.screenNotesCreate));
    await tester.pumpAndSettle();

    // Fill title and save.
    await tester.enterText(find.byKey(AppKeys.screenNoteEditorTitle), 'Hello');
    await tester.enterText(find.byKey(AppKeys.screenNoteEditorBody), 'World');
    await tester.tap(find.byKey(AppKeys.screenNoteEditorSave));

    await tester.pumpAndSettle();

    // Verify the note is visible in the list.
    expect(find.text('Hello'), findsOneWidget);
  });
}
