import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_application_1/main.dart';

void main() {
  testWidgets('Color changes on tap', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Main());

    // Verify that the initial text is "Hello there".
    expect(find.text('Hello there'), findsOneWidget);

    // Verify that the initial background color is white.
    final Scaffold scaffold = tester.widget(find.byType(Scaffold));
    expect(scaffold.backgroundColor, equals(Colors.white));

    // Simulate a tap and trigger a frame.
    await tester.tap(find.byType(InkWell));
    await tester.pump();

    // After tapping, the color should change (it shouldn't be white anymore).
    final Scaffold updatedScaffold = tester.widget(find.byType(Scaffold));
    expect(updatedScaffold.backgroundColor, isNot(equals(Colors.white)));
  });
}
