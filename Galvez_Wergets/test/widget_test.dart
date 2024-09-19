import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.dart'; 

void main() {
  testWidgets('Counter increments and decrements', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(CounterApp());  

    // Verify initial count is 0
    expect(find.text('Current Count:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' button and trigger a frame
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify count incremented
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' button and trigger a frame
    await tester.tap(find.text('Decrement'));
    await tester.pump();

    // Verify count decremented
    expect(find.text('0'), findsOneWidget);
  });
}
