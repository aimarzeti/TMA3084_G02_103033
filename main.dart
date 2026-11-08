import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaStoreApp());
}

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Store',
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
          imagePath: 'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?auto=format&fit=crop&w=1200&q=85',
          description: 'A fresh pizza topped with colorful vegetables, melted cheese, and savory tomato sauce.',
        ),
        '/cheese': (context) => const DetailScreen(
          title: 'Cheese Pizza',
          imagePath: 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=1200&q=85',
          description: 'A classic favorite with a generous layer of melted cheese over rich tomato sauce.',
        ),
        '/fries': (context) => const DetailScreen(
          title: 'Box of Fries',
          imagePath: 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=1200&q=85',
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
      route: '/vegetable',
      icon: Icons.local_pizza,
    ),
    _MenuItem(title: 'Cheese Pizza', route: '/cheese', icon: Icons.local_pizza),
    _MenuItem(title: 'Box of Fries', route: '/fries', icon: Icons.fastfood),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Store Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
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
                onTap: () => Navigator.pushNamed(context, item.route),
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
            child: Image.network(
              imagePath,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 240,
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
            child: FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
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
    required this.route,
    required this.icon,
  });

  final String title;
  final String route;
  final IconData icon;
}
