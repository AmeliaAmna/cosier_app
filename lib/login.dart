import 'package:flutter/material.dart';
import 'home.dart'; // Import the Home page
import 'signup.dart'; // Import the Sign Up page (to be created)

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to capture user input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Simple validation to check if fields are not empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // Navigate to home page on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Show error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Login page header
              const Text(
                "LOGIN TO YOUR ACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Email input field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Password input field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: passwordController,
                  obscureText: true, // To obscure password text
                  decoration: const InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Forgot password link (currently no functionality)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot your password?", style: TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(height: 12),

              // Login button
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: _login, // Trigger login function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800], // Set background color
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Link to create a new account (Navigate to SignUpPage)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text("OR CREATE AN ACCOUNT", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
