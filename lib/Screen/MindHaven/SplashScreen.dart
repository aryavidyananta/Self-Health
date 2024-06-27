// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/OnBoarding_Screen.dart';
import 'package:my_self/Screen/started.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();

    // ignore: prefer_const_constructors
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: _animation!.value,
          child: Image.asset("assets/images/Logomind.png"),
        ),
      ),
    );
  }
}
