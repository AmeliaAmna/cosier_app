import 'package:flutter/material.dart';
import 'home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define controllers for each text field
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "SIGN UP FOR COSIER ACCOUNT",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // First Name Field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Last Name Field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Email Field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Password Field
              SizedBox(
                height: 44,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Sign Up Button
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to navigate to the home page
                    // Example: Push to home page when form is filled
                    if (firstNameController.text.isNotEmpty &&
                        lastNameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      // Navigate to HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // You can add an error message or validation
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text('Please fill all the fields'),
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Login Text Button
              TextButton(
                onPressed: () {
                  // Optionally, navigate to the login page
                },
                child: const Text("OR LOGIN", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


