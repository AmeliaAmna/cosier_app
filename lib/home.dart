import 'package:flutter/material.dart';
import 'nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(title: const Text("Cosier")),
      drawer: const NavDrawer(), // ✅ Navigation Drawer
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroSection(), // ✅ Top Banner
            _sectionTitle("New Arrival"),
            _newArrivalGrid(isPortrait: isPortrait), // ✅ Grid with products
            _aboutSection(), // ✅ About Section
            const Footer(), // ✅ Footer
          ],
        ),
      ),
    );
  }

  /// 🎯 **Hero Section (Top Banner)**
  Widget _heroSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/cosier_23.png", // Change to your image
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {},
            child: const Text("SHOP NOW"),
          ),
        ),
      ],
    );
  }

  /// 🎯 **New Arrival Section**
  Widget _newArrivalGrid({required bool isPortrait}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4, // ✅ Portrait: 2, Landscape: 4
          childAspectRatio: 0.7, // ✅ Keep aspect ratio for product images
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4, // Only showing 4 items
        itemBuilder: (context, index) {
          return _productCard(index);
        },
      ),
    );
  }

  /// 🎯 **Product Card**
  Widget _productCard(int index) {
    List<Map<String, String>> products = [
      {"image": "assets/images/cosier_3.jpg", "name": "Scrunched Top", "price": "LKR 3,200"},
      {"image": "assets/images/cosier_15.jpg", "name": "COMFY Set", "price": "LKR 5,800"},
      {"image": "assets/images/cosier_14.jpg", "name": "Mia Basic Tee", "price": "LKR 2,300"},
      {"image": "assets/images/cosier_13.jpg", "name": "Ruth Crop Tee", "price": "LKR 3,200"},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              products[index]["image"]!,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products[index]["name"]!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(products[index]["price"]!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🎯 **About Section**
  Widget _aboutSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle("ABOUT COSIÈR"),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Welcome to Cosier, your trusted destination for timeless and comfortable women's fashion..."
                  "\n\nExplore our curated selection today to find the perfect pieces that suit your lifestyle and needs.",
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/cosier_50.jpg",
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🎯 **Section Title**
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

/// 🎯 **Footer Widget**
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Text("© 2024 Cosier. All Rights Reserved.", style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 5),
          Text("Privacy Policy | Terms & Conditions", style: TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}
