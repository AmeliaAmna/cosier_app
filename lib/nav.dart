import 'package:cosier/cart.dart'; 
import 'package:cosier/profile.dart';
import 'package:flutter/material.dart';
import 'shop.dart'; 
import 'login.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(182, 83, 56, 44)),
            child: Text(
              'COSIÉR',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled), // Filled Home icon
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.storefront), // Trendy Shop icon
            title: const Text('Shop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket), // Trendy Cart icon with a basket
            title: const Text('My Cart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline), // Modern Outline Profile icon
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded), // Rounded Logout icon
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
