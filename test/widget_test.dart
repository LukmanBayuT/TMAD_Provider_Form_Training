// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider_form/main.dart';
import 'package:provider_form/views/homepage.dart';

void main() {
  testWidgets('Testing Widget, Adding User', (WidgetTester tester) async {
    final addField = find.byKey(ValueKey('addField'));
    final addButton = find.byKey(ValueKey('addButton'));

    await tester.pumpWidget(HomePage());
    await tester.enterText(addField, "Testing Field");
    await tester.tap(addButton);
    await tester.pump();

    expect(find.text("Testing Field"), findsOneWidget);
  });
}
