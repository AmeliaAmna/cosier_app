import 'package:flutter/material.dart';
import 'home.dart'; 
import 'signup.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to capture user input for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to handle login action
  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validate that both fields are not empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // Navigate to the home page on successful login
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
              // Header text for the login page
              const Text(
                "LOGIN TO YOUR COSIÉR ACCOUNT",
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

              // Login button to trigger the login function
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: _login, // Calls _login function
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

              // Link to navigate to the SignUp page for account creation
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
