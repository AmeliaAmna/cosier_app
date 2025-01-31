import 'package:flutter/material.dart';
import 'nav.dart';
import 'shop.dart';
import 'cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),  // ✅ Using reusable AppBar
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _heroSection(context),
            _sectionTitle("New Arrival"),
            _newArrivalGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _heroSection(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/cosier_23.png",
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(145, 114, 87, 59).withOpacity(0.6),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
              );
            },
            child: const Text(
              "SHOP NOW",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Widget _newArrivalGrid(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1200) return 5;
      if (screenWidth >= 800) return 4;
      if (screenWidth >= 600) return 3;
      return 2;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossAxisCount(),
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _productCard(index);
        },
      ),
    );
  }

  Widget _productCard(int index) {
    List<Map<String, String>> products = [
      {
        "image": "assets/images/cosier_49.jpg",
        "name": "Scrunched Top",
        "price": "LKR 3,200"
      },
      {
        "image": "assets/images/cosier_3.jpg",
        "name": "COMFY Set",
        "price": "LKR 5,800"
      },
      {
        "image": "assets/images/cosier_14.jpg",
        "name": "Mia Basic Tee",
        "price": "LKR 2,300"
      },
      {
        "image": "assets/images/cosier_15.jpg",
        "name": "Ruth Crop Tee",
        "price": "LKR 3,200"
      },
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              products[index % products.length]["image"]!,
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
                Text(products[index % products.length]["name"]!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(products[index % products.length]["price"]!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
