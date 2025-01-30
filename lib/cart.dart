import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Long Sleeve Lia Top",
      "price": 3200,
      "image": "assets/images/cosier_15.jpg",
      "quantity": 1,
      "size": "M",
    },
  ];

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]["quantity"]++;
    });
  }

  void _decrementQuantity(int index) {
    if (cartItems[index]["quantity"] > 1) {
      setState(() {
        cartItems[index]["quantity"]--;
      });
    }
  }

  void _removeProduct(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int subtotal = cartItems.fold<int>(
      0,
      (sum, item) => sum + (item["price"] as int) * (item["quantity"] as int),
    );
    int shippingFee = 300;
    int total = subtotal + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (cartItems.isNotEmpty)
              ...cartItems.map((item) {
                int index = cartItems.indexOf(item);
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item["image"],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported, size: 50),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text("Size: ${item["size"]}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _decrementQuantity(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Icon(Icons.remove, size: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text('${item["quantity"]}',
                                        style: const TextStyle(fontSize: 16)),
                                  ),
                                  GestureDetector(
                                    onTap: () => _incrementQuantity(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Icon(Icons.add, size: 16),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("LKR ${item["price"] * item["quantity"]}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeProduct(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal", style: TextStyle(fontSize: 16)),
                Text("LKR $subtotal", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Shipping Fee", style: TextStyle(fontSize: 16)),
                Text("LKR $shippingFee", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("LKR $total",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Checkout feature coming soon!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Proceed to Checkout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
