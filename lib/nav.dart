import 'package:flutter/material.dart';
import 'shop.dart';
import 'cart.dart';
import 'profile.dart';
import 'login.dart';

/// Reusable AppBar for consistency across screens
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "COSIÉR",
        style: TextStyle(
          fontFamily: 'Roboto', // Font style for the title
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5, // Spacing between letters
        ),
      ),
      centerTitle: true, // Centers the title
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu), // Menu icon for the drawer
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Opens the navigation drawer
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined), // Cart icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()), // Navigate to Cart page
            );
          },
        ),
      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // AppBar background color from theme
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor, // AppBar text color from theme
      elevation: 2, // AppBar shadow depth
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Height of the AppBar
}

/// Navigation Drawer for the app
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(182, 83, 56, 44)), // Background color of the header
            child: Text(
              'COSIÉR',
              style: TextStyle(
                fontSize: 24, // Header text size
                color: Colors.white, // Header text color
                fontWeight: FontWeight.w500, // Header text weight
              ),
            ),
          ),
          // Navigation links in the drawer
          ListTile(
            leading: const Icon(Icons.home_filled), // Home icon
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer when tapping on Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.storefront), // Shop icon
            title: const Text('Shop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()), // Navigate to the Shop page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket), // Cart icon
            title: const Text('My Cart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()), // Navigate to the Cart page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline), // Profile icon
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()), // Navigate to the Profile page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded), // Logout icon
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()), // Navigate to Login page and clear the navigation stack
                (route) => false, // Clears the navigation stack so the user cannot go back
              );
            },
          ),
        ],
      ),
    );
  }
}
