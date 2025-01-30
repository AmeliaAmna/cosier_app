import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const ProductPage({super.key, required this.name, required this.price, required this.image});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              widget.price,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'A stylish high-quality T-shirt perfect for comfort and layering.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

             // Size Selector
            const Text(
              'Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align left
              children: ['XS', ' S ', ' M ', ' L ', 'XL']
                  .map((size) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(size, style: const TextStyle(color: Colors.white)),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Square corners
                          ),
                          selected: false,
                          onSelected: (bool selected) {},
                          selectedColor: const Color.fromARGB(255, 39, 39, 39), // Grey background for selected state
                          backgroundColor: const Color.fromARGB(236, 51, 51, 51), // Grey background for default state
                          side: BorderSide.none, // Remove border
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Quantity Selector
            const Text(
              'Quantity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align left
              children: [
                // Container for quantity selector with border
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1), // Border line
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: _decrementQuantity,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: const Icon(Icons.remove, color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '$quantity',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      GestureDetector(
                        onTap: _incrementQuantity,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            
            //Action Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      double.infinity, // Ensures the button takes up full width
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color.fromARGB(236, 51, 51, 51)), // Grey background
                      foregroundColor:
                          WidgetStateProperty.all(Colors.white), // White text
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: const Text("Add to Cart"),
                  ),
                ),
                const SizedBox(height: 16), // Space between the buttons
                SizedBox(
                  width:
                      double.infinity, // Ensures the button takes up full width
                  child: ElevatedButton( // Changed from OutlinedButton to ElevatedButton
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color.fromARGB(236, 51, 51, 51)), // Grey background
                      foregroundColor:
                          WidgetStateProperty.all(Colors.white), // White text
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: const Text("Buy Now"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}