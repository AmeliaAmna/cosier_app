import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "Scrunched Top", "price": "LKR 3,200", "image": "assets/images/cosier_15.jpg"},
    {"name": "COMFY Set", "price": "LKR 5,800", "image": "assets/images/cosier_12.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_13.jpg"},
    {"name": "Ruth Crop Tee", "price": "LKR 3,200", "image": "assets/images/cosier_14.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_11.jpg"},
    {"name": "Stella Tee", "price": "LKR 3,200", "image": "assets/images/cosier_3.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COSIER"),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.shopping_bag), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.6,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              name: products[index]["name"]!,
              price: products[index]["price"]!,
              image: products[index]["image"]!,
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 50), // ✅ Prevents crash if image is missing
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
