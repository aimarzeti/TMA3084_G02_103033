import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_store_app/main.dart';

void main() {
  testWidgets('menu lists all three products', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('each menu item opens its matching named route', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    const menuItems = {
      'Vegetable Pizza': 'fresh pizza topped with colorful vegetables',
      'Cheese Pizza': 'classic favorite with a generous layer of melted cheese',
      'Box of Fries': 'Golden, crispy fries served in a box',
    };

    for (final item in menuItems.entries) {
      await tester.tap(find.text(item.key));
      await tester.pumpAndSettle();

      expect(find.text(item.key), findsNWidgets(2));
      expect(find.textContaining(item.value), findsOneWidget);
      expect(find.text('Back to Menu'), findsOneWidget);

      await tester.tap(find.text('Back to Menu'));
      await tester.pumpAndSettle();
    }
  });

  testWidgets('detail Back to Menu returns to the menu', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Back to Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
  });
}
