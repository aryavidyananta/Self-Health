import 'package:flutter/material.dart';
import 'package:my_self/Screen/news_screen.dart';
import 'package:my_self/Screen/started.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: LoginSignUpScreen(),
      routes: {'/news-screen': (context) => const NewsScreen()},
    );
  }
}
