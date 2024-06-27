// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_self/Screen/started.dart'; // Adjust the import to your actual login/signup screen

// ignore: use_key_in_widget_constructors
class OnboardingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              introKey.currentState?.skipToEnd();
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Color.fromARGB(255, 13, 143, 134)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50.0), // Adjust the top padding here
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title:
                  "Temui dan Dapatkan Saran dari Psikolog yang Ahli dan Terpercaya",
              body: "",
              image: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0), // Adjust the top padding here
                child: Image.asset(
                  "assets/images/on1.png",
                  height: 300, // Increased height
                  width: 300, // Increased width
                ),
              ),
              decoration: const PageDecoration(
                pageColor: Colors.white,
                titlePadding: EdgeInsets.only(
                    top: 0.0,
                    bottom: 20.0), // Reduce space between title and button
              ),
            ),
            PageViewModel(
              title: "Raih Ketenangan Dan Kedamaian Melalui Meditasi",
              body: "",
              image: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0), // Adjust the top padding here
                child: Image.asset("assets/images/on2.png",
                    height: 300.0, width: 300.0), // Increased height and width
              ),
              decoration: const PageDecoration(
                pageColor: Colors.white,
                titlePadding: EdgeInsets.only(
                    top: 0.0,
                    bottom: 20.0), // Reduce space between title and button
              ),
            ),
          ],
          onDone: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginSignUpScreen()));
          },
          onSkip: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginSignUpScreen()));
          },
          showSkipButton: false,
          skip: const Text("Skip"),
          next: const Icon(
            Icons.arrow_forward_outlined,
            color: Color.fromARGB(255, 13, 143, 134),
          ),
          done: const Text("Done",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 13, 143, 134))),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeColor: Color.fromARGB(255, 13, 143, 134),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          showBackButton: true,
          back: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 13, 143, 134),
          ),
        ),
      ),
    );
  }
}
