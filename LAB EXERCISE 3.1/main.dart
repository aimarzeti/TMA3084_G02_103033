import 'package:flutter/material.dart';

void main() {
  runApp(const PinkBakeryApp());
}

class PinkBakeryApp extends StatelessWidget {
  const PinkBakeryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pink Petal Bakery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MenuHomePage(),
    );
  }
}

class MenuHomePage extends StatelessWidget {
  const MenuHomePage({super.key});

  final List<Map<String, dynamic>> bakeryItems = const [
    {
      'name': 'Strawberry Macaron Tower',
      'price': 'RM 15.00',
      'description':
          'Delicate French macarons filled with creamy strawberry ganache.',
      'rating': '4.9',
      'image': 'https://images.unsplash.com/photo-1569864358642-9d1684040f43?auto=format&fit=crop&w=500&q=80',
    },
    {
      'name': 'Raspberry Glazed Croissant',
      'price': 'RM 9.50',
      'description':
          'Flaky buttery layers topped with sweet pink raspberry frosting.',
      'rating': '4.8',
      'image': 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?auto=format&fit=crop&w=500&q=80',
    },
    {
      'name': 'Sakura Strawberry Cake',
      'price': 'RM 14.00',
      'description':
          'Soft sponge cake layered with fresh cream and sweet strawberries.',
      'rating': '5.0',
      'image': 'https://images.unsplash.com/photo-1535141192574-5d4897c13136?auto=format&fit=crop&w=500&q=80',
    },
    {
      'name': 'Pink Velvet Cupcake',
      'price': 'RM 8.00',
      'description':
          'Moist pink velvet sponge with a fluffy cream cheese swirl.',
      'rating': '4.7',
      'image': 'https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?auto=format&fit=crop&w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Row(
          children: [
            Icon(Icons.cake, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Pink Petal Bakery',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.pink[50], // Soft pink background
        child: ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: bakeryItems.length,
          itemBuilder: (context, index) {
            final item = bakeryItems[index];
            return Card(
              elevation: 3.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pastry Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        item['image']!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                item['price']!,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['description']!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item['rating']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
