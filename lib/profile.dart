import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final isDarkMode = theme.brightness == Brightness.dark; // Check if it's dark mode
    final textColor = isDarkMode ? Colors.white : Colors.black; // Use white in dark mode

    return Scaffold(
      backgroundColor: theme.colorScheme.background, // Set background color based on the theme
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? const Color.fromARGB(255, 255, 255, 255), // Set the AppBar color
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black), // Title text color
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(  // Add SingleChildScrollView for scrollable content
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
                    backgroundImage: AssetImage('assets/images/login.jpg'), // Use your asset image here
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amelia Amna',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: textColor), // Set text color
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Colombo, Sri Lanka',
                        style: TextStyle(color: textColor), // Set text color
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
                  color: theme.cardColor, // Set card background color based on theme
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.2), // Adjust shadow color based on theme
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
    final theme = Theme.of(context); // Get current theme
    final isDarkMode = theme.brightness == Brightness.dark; // Check if it's dark mode
    final textColor = isDarkMode ? Colors.white : Colors.black; // Use white in dark mode

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: textColor), // Set text color
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: textColor), // Set text color
          ),
        ],
      ),
    );
  }
}
