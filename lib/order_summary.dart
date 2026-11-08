import 'package:flutter/material.dart';

const List<Map<String, Object>> _orderItems = [
  {'name': 'Vegetable Pizza', 'price': 15.0, 'quantity': 1},
  {'name': 'Box of Fries', 'price': 10.0, 'quantity': 1},
];

double orderTotal(List<Map<String, Object>> items) {
  return items.fold<double>(0, (total, item) {
    final price = item['price'];
    final quantity = item['quantity'];
    if (price is! num || quantity is! num) {
      throw ArgumentError(
        'Each order item must include numeric price and quantity values.',
      );
    }

    return (total + (price * quantity)).toDouble();
  });
}

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = orderTotal(_orderItems);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: _orderItems.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = _orderItems[index];
                  final name = item['name'] as String;
                  final price = item['price'] as num;
                  final quantity = item['quantity'] as num;
                  final subtotal = price * quantity;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text('Quantity: $quantity'),
                                Text(
                                  'Subtotal: RM ${subtotal.toStringAsFixed(2)}',
                                ),
                              ],
                            ),
                          ),
                          Text('RM ${price.toStringAsFixed(2)} each'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Total: RM ${total.toStringAsFixed(2)}',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
