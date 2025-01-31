import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Choose a color that works well for both light and dark modes
    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.grey[50];
    final cardColor = isDarkMode ? Colors.grey[800] : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor, // Set background color based on theme
      appBar: AppBar(
        backgroundColor: backgroundColor, // Set AppBar color to match background
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black), // Title text color
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView for scrollable content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Picture and Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/login.jpg'), // Your asset image here
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amelia Amna',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor, // Set text color based on theme
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Colombo, Sri Lanka',
                        style: TextStyle(color: textColor), // Set text color based on theme
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Card Section with categories
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: cardColor, // Set card background color based on theme
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Adjust shadow color
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    ProfileRowItem(label: 'Email', value: 'Amna@gmail.com'),
                    ProfileRowItem(label: 'Phone', value: '0123456789'),
                    ProfileRowItem(label: 'Member Since', value: 'Jan 2025'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileRowItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfileRowItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black; // Set text color based on theme

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: textColor), // Set text color based on theme
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: textColor), // Set text color based on theme
          ),
        ],
      ),
    );
  }
}
