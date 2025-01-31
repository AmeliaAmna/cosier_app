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
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      ),
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),
      ],
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
            decoration: BoxDecoration(color: Color.fromARGB(182, 83, 56, 44)),
            child: Text(
              'COSIÉR',
              style: TextStyle(
                  fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Closes drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.storefront),
            title: const Text('Shop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('My Cart'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false, // Clears navigation stack
              );
            },
          ),
        ],
      ),
    );
  }
}
