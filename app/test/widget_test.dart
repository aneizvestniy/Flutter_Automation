import 'package:flutter_test/flutter_test.dart';

import 'package:training_app/core/testing/keys.dart';
import 'package:training_app/main.dart';

void main() {
  testWidgets('App boots and shows Login screen (key-based assertion)', (WidgetTester tester) async {
    // Smoke test for boot.
    await tester.pumpWidget(const TrainingApp());
    await tester.pumpAndSettle();

    // Stable assertion: key exists.
    expect(find.byKey(AppKeys.screenLoginEmail), findsOneWidget);
    expect(find.byKey(AppKeys.screenLoginSubmit), findsOneWidget);
  });
}
