import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
      child: const Center(
        child: Text("© 2024 COSIER - All Rights Reserved", style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
