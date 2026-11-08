import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pizza_store_app/main.dart';

void main() {
  testWidgets('Vegetable Pizza detail screen renders for screenshots', (
    tester,
  ) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ListTile, 'Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza'), findsNWidgets(2));
    expect(
      find.text(
        'A fresh pizza topped with colorful vegetables, melted cheese, and savory tomato sauce.',
      ),
      findsOneWidget,
    );
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.restaurant), findsOneWidget);
    expect(find.text('Back to Menu'), findsOneWidget);
    expect(
      find.descendant(
        of: find.widgetWithText(ElevatedButton, 'Back to Menu'),
        matching: find.byIcon(Icons.arrow_back),
      ),
      findsOneWidget,
    );

    debugPrint('''
Vegetable Pizza detail screen
`-- Scaffold
    |-- AppBar
    |   `-- Text("Vegetable Pizza")
    `-- ListView
        |-- ClipRRect
        |   `-- Image.asset (placeholder: restaurant icon)
        |-- Text("Vegetable Pizza")
        |-- Text("A fresh pizza topped with colorful vegetables, melted cheese, and savory tomato sauce.")
        `-- Back to Menu button
''');
  });
}
