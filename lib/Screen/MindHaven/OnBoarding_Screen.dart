// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/started.dart'; // Adjust the import to your actual login/signup screen

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageContent(BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              "assets/images/on1.png",
              height: 350,
              width: 350,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Temui dan Dapatkan Saran dari Psikolog yang Ahli dan Terpercaya",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              "assets/images/on2.png",
              height: 400,
              width: 350,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Raih Ketenangan Dan Kedamaian Melalui Meditasi",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _buildPageContent(context),
          ),
          Positioned(
            bottom: 30.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage == 0
                    ? SizedBox.shrink()
                    : IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Color.fromARGB(255, 13, 143, 134)),
                        onPressed: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                Row(
                  children: List<Widget>.generate(2, (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 10.0,
                      width: _currentPage == index ? 20.0 : 10.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color.fromARGB(255, 13, 143, 134)
                            : Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward,
                      color: Color.fromARGB(255, 13, 143, 134)),
                  onPressed: () {
                    if (_currentPage == 1) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const LoginSignUpScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
