import 'package:flutter/material.dart';

import 'order_summary.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
        '/vegetable': (context) => const DetailScreen(
          title: 'Vegetable Pizza',
          imagePath: 'assets/images/vegetable_pizza.png',
          description: 'A fresh pizza topped with colorful vegetables, melted cheese, and savory tomato sauce.',
        ),
        '/cheese': (context) => const DetailScreen(
          title: 'Cheese Pizza',
          imagePath: 'assets/images/cheese_pizza.png',
          description: 'A classic favorite with a generous layer of melted cheese over rich tomato sauce.',
        ),
        '/fries': (context) => const DetailScreen(
          title: 'Box of Fries',
          imagePath: 'assets/images/fries.png',
          description: 'Golden, crispy fries served in a box, perfect for sharing with your pizza.',
        ),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  static const _menuItems = [
    _MenuItem(
      title: 'Vegetable Pizza',
      routeName: '/vegetable',
      icon: Icons.local_pizza,
    ),
    _MenuItem(
      title: 'Cheese Pizza',
      routeName: '/cheese',
      icon: Icons.local_pizza,
    ),
    _MenuItem(title: 'Box of Fries', routeName: '/fries', icon: Icons.fastfood),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Store Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Order summary',
            icon: const Icon(Icons.receipt_long),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const OrderSummaryScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final item in _menuItems)
            Card(
              color: Colors.orange,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(item.icon, color: Colors.white, size: 32),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.white),
                onTap: () => Navigator.pushNamed(context, item.routeName),
              ),
            ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    required this.title,
    required this.imagePath,
    required this.description,
    super.key,
  });

  final String title;
  final String imagePath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Colors.orange.shade100,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.restaurant,
                  color: Colors.deepOrange,
                  size: 72,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Menu'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem({
    required this.title,
    required this.routeName,
    required this.icon,
  });

  final String title;
  final String routeName;
  final IconData icon;
}
