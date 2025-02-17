import 'package:flutter/material.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List of cart items, each containing product details
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Long Sleeve Lia Top",
      "price": 3200,
      "image": "assets/images/cosier_49.jpg",
      "quantity": 1,
      "size": "M",
    },
  ];

  // Increment quantity of the item in the cart
  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]["quantity"]++;
    });
  }

  // Decrement quantity of the item in the cart
  void _decrementQuantity(int index) {
    if (cartItems[index]["quantity"] > 1) {
      setState(() {
        cartItems[index]["quantity"]--;
      });
    }
  }

  // Remove product from the cart
  void _removeProduct(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate subtotal, shipping fee, and total price
    int subtotal = cartItems.fold<int>(
      0,
      (sum, item) => sum + (item["price"] as int) * (item["quantity"] as int),
    );
    int shippingFee = 300;  // Fixed shipping fee
    int total = subtotal + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CART"),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Display cart items if any are present
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
                        // Display product image with fallback on error
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
                              // Display product name
                              Text(item["name"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              // Display product size
                              Text("Size: ${item["size"]}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              const SizedBox(height: 8),
                              // Row for incrementing and decrementing quantity
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
                            // Display total price for the current item
                            Text("LKR ${item["price"] * item["quantity"]}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            // Button to remove the item from cart
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
              }),
            const Divider(),
            const SizedBox(height: 16),
            // Subtotal and shipping fee rows
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
            // Total price row
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
            // Button to proceed to checkout
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to CheckoutPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800], // Dark grey color
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Square corners
                  ),
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
