import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Controllers for the text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Variables for storing images
  XFile? _idImage;
  XFile? _licenseImage;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform signup action
      print("Form is valid");
      // Perform signup or navigate
    } else {
      // Form is invalid
      print("Form is invalid");
    }
  }

  // Method to pick an image (ID or License)
  Future<void> _pickImage(bool isId) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (isId) {
        _idImage = pickedImage;
      } else {
        _licenseImage = pickedImage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% padding on each side
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logoblue.png',
                    height: screenHeight * 0.2, // 20% of screen height for the logo
                    width: screenWidth * 0.3, // 30% of screen width for the logo
                  ),
                  SizedBox(height: screenHeight * 0.02), // Small gap between logo and text
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // 8% of screen width for title size
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 28, 46),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // Gap before the form starts
        
                  // First Name TextField with validation
                  _buildTextField(
                    controller: _firstNameController,
                    labelText: 'First Name',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Last Name TextField with validation
                  _buildTextField(
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Email TextField with validation
                  _buildTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Phone Number TextField with validation
                  _buildTextField(
                    controller: _phoneController,
                    labelText: 'Phone Number',
                    icon: Icons.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Password TextField with validation and show/hide password functionality
                  _buildPasswordField(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: _obscurePassword,
                    toggleVisibility: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Confirm Password TextField with validation and show/hide password functionality
                  _buildPasswordField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm Password',
                    obscureText: _obscureConfirmPassword,
                    toggleVisibility: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    confirmPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // ID Photo Picker Button with customized color
                  ElevatedButton(
                    onPressed: () => _pickImage(true),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue), // Change button color
                    ),
                    child: Text('Upload ID Photo', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Driver's License Photo Picker Button with customized color
                  ElevatedButton(
                    onPressed: () => _pickImage(false),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green), // Change button color
                    ),
                    child: Text('Upload Driver\'s License Photo', style: TextStyle(color: Colors.white)),
                  ),
        
                  SizedBox(height: screenHeight * 0.05),
        
                  // Sign Up button
                  ElevatedButton(
                    onPressed: _submit,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF007BFF)),
                    ),
                    child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: screenHeight * 0.02),
        
                  // Login navigation
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(color: Color.fromARGB(255, 6, 28, 46)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build TextFormFields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color.fromARGB(255, 6, 28, 46)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: Color.fromARGB(255, 6, 28, 46)),
      ),
      style: TextStyle(color: Colors.black),
      validator: validator,
    );
  }

  // Helper function to build Password TextField with toggle visibility
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    required VoidCallback toggleVisibility,
    bool confirmPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color.fromARGB(255, 6, 28, 46)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color.fromARGB(255, 6, 28, 46), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 6, 28, 46)),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Color.fromARGB(255, 6, 28, 46),
          ),
          onPressed: toggleVisibility,
        ),
      ),
      style: TextStyle(color: Colors.black),
      validator: confirmPassword
          ? (value) {
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            }
          : null,
    );
  }
}
