import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // GlobalKey to manage form validation
  final _formKey = GlobalKey<FormState>();

  // Variables for password visibility toggle
  bool _obscurePassword = true;

  // Controllers for the text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Method to handle form submission
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform login action
      print("Form is valid");
      // Perform login or navigate
    } else {
      // Form is invalid
      print("Form is invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logoblue.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 6, 28, 46), // Dark color for app name
                  ),
                ),
                SizedBox(height: 40),

                // Email TextField with validation
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 6, 28, 46)), // Blue label color
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Curved borders
                      borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46)), // Blue border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Curved borders
                      borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46), width: 2), // Blue focused border color
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 6, 28, 46)), // Email icon
                  ),
                  style: TextStyle(color: Colors.black),
                  // Email validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password TextField with validation and show/hide password functionality
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 6, 28, 46)), // Blue label color
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Curved borders
                      borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46)), // Blue border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Curved borders
                      borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46), width: 2), // Blue focused border color
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 6, 28, 46)), // Lock icon
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Color.fromARGB(255, 6, 28, 46),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  // Password validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),

                // Login button with blue background
                ElevatedButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF007BFF)), // Blue button color
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.white)), // White text on the button
                ),
                SizedBox(height: 20),

                // Sign Up navigation with blue text
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup'); // Navigate to signup
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Color.fromARGB(255, 6, 28, 46)), // Blue text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
