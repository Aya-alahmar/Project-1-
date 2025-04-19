import 'package:flutter/material.dart';
import '../onboarding.dart'; // Import the onboarding page
import '../login_page.dart';
import '../signup_page.dart';
import '../splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the initial screen to OnboardingPage
      home: OnboardingPage(),

      title: 'Black and Red App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/splash', // Start with the onboarding screen
      
      routes: {
        '/onboarding': (context) => OnboardingPage(), // Route for onboarding
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
      debugShowCheckedModeBanner: false, // Optional: to hide the debug banner
    );
  }
}
