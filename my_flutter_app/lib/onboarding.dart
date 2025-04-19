import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> _onboardingData = [
    {
      'image': 'images/Asset7.jpg',  // Add your image path here
      'title': 'Welcome to Rentel Car',
      'description': 'Explore and rent the best cars at affordable prices.',
    },
    {
      'image': 'images/Asset6.jpg',  // Add your image path here
      'title': 'Drive with Comfort',
      'description': 'Enjoy a smooth and comfortable ride in your dream car.',
    },
    {
      'image': 'images/Asset8.png',  // Add your image path here
      'title': 'Get Started Now',
      'description': 'Sign up now to begin your rental experience.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // PageView for onboarding screens
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return _buildPage(
                  image: _onboardingData[index]['image']!,
                  title: _onboardingData[index]['title']!,
                  description: _onboardingData[index]['description']!,
                );
              },
            ),
          ),
          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => _buildIndicator(index),
            ),
          ),
          SizedBox(height: 20),
          // Next button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == _onboardingData.length - 1) {
                  // Navigate to the login page
                  Navigator.of(context).pushReplacementNamed('/login');
                } else {
                  // Move to next page
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 6, 28, 46)),
              ),
              child: Text(
                _currentPage == _onboardingData.length - 1
                    ? 'Get Started'
                    : 'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image with cover fit
          AnimatedOpacity(
            opacity: 1.0,
            duration: Duration(seconds: 1),
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width, // Full screen width
              height: MediaQuery.of(context).size.height * 0.45, // 45% of screen height
              fit: BoxFit.cover, // Ensures the image covers the container
            ),
          ),
          SizedBox(height: 20),
          // Title Text
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 6, 28, 46),
            ),
          ),
          SizedBox(height: 10),
          // Description Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Color.fromARGB(255, 6, 28, 46) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
