import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_15/main.dart';

class FunctionCalculator {
  double calculate(double x) {
    if (x == 4) {
      throw ArgumentError('Division by zero is not allowed when x equals 4');
    }
    return x * x / (4 - x);
  }
}

void main() {
  group('FunctionCalculator tests', () {
    test('Correctly calculates the function y = x^2 / (4 - x)', () {
      final calculator = FunctionCalculator();
      expect(calculator.calculate(0), 0);
      expect(calculator.calculate(2), 1);
      expect(calculator.calculate(-2), 4);
      expect(calculator.calculate(1), 1.0);
      expect(() => calculator.calculate(4), throwsArgumentError);
    });
  });

  testWidgets('Home page displays correct title text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('IPZ-33: Veronica last Flutter App'), findsOneWidget);
  });

  testWidgets('FloatingActionButton uses correct icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final floatingActionButton = find.byType(FloatingActionButton);
    expect(floatingActionButton, findsOneWidget);
    expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);
  });

  testWidgets('Counter increments by 2 on FAB press', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('4'), findsOneWidget);
  });
}
