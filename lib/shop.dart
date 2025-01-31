import 'package:flutter/material.dart';
import 'product.dart';

class ShopPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {"name": "Scrunched Top", "price": "LKR 3,200", "image": "assets/images/cosier_15.jpg"},
    {"name": "COMFY Set", "price": "LKR 5,800", "image": "assets/images/cosier_12.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_33.jpg"},
    {"name": "Ruth Crop Tee", "price": "LKR 3,200", "image": "assets/images/cosier_14.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_11.jpg"},
    {"name": "Stella Tee", "price": "LKR 3,200", "image": "assets/images/cosier_3.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_39.jpg"},
    {"name": "Mia Basic Tee", "price": "LKR 3,200", "image": "assets/images/cosier_13.jpg"},
  ];

  ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to decide the grid layout based on orientation
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text("COSIÉR SHOP"),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.shopping_bag), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 2 : 4,  // 2 items per row in portrait, 4 in landscape
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.6, // Adjust the aspect ratio as needed for landscape
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate with fade transition and Hero animation
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500), // Animation duration
                    pageBuilder: (context, animation, secondaryAnimation) => ProductPage(
                      name: products[index]["name"]!,
                      price: products[index]["price"]!,
                      image: products[index]["image"]!,
                    ),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation, // Fading effect
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: ProductCard(
                name: products[index]["name"]!,
                price: products[index]["price"]!,
                image: products[index]["image"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Product card to display items in the grid
class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const ProductCard({super.key, required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: image, // Hero animation tag for smooth transition
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 50),
                ),
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
