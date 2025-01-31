import 'dart:ui';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF232526), Color(0xFF414345)],
              ),
            ),
          ),

          // Frosted Glass Card
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile Image
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Change this
                      ),
                      const SizedBox(height: 15),

                      // Name & Location
                      const Text(
                        "Your Name", // Change this
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Your City, Your Country", // Change this
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 15),
                      const Divider(color: Colors.white38),

                      // Info Items
                      ProfileRowItem(label: "Email", value: "your@email.com"),
                      ProfileRowItem(label: "Phone", value: "+123456789"),
                      ProfileRowItem(label: "Member Since", value: "Jan 2024"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileRowItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRowItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }
}
