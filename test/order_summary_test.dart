import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_store_app/order_summary.dart';

void main() {
  testWidgets('order summary shows item details and RM 25.00 total', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: OrderSummaryScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsNWidgets(2));
    expect(find.text('Subtotal: RM 15.00'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
    expect(find.text('Subtotal: RM 10.00'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsOneWidget);
    expect(
      orderTotal([
        {'name': 'Vegetable Pizza', 'price': 15.0, 'quantity': 1},
        {'name': 'Box of Fries', 'price': 10.0, 'quantity': 1},
      ]),
      25.0,
    );
  });

  testWidgets('Back pops the order summary to its caller', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const OrderSummaryScreen(),
                  ),
                );
              },
              child: const Text('Open summary'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open summary'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    expect(find.text('Open summary'), findsOneWidget);
    expect(find.text('Order Summary'), findsNothing);
  });
}
