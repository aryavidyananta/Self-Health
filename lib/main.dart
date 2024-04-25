import 'package:flutter/material.dart';
import 'package:my_self/Screen/Base.dart';
import 'package:my_self/Screen/news_screen.dart';

import 'package:my_self/Screen/routes/DatasScreen.dart';
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
      home: const LoginSignUpScreen(),
      initialRoute: '/',
      routes: {
        '/base': (context) => const BaseScreen(),
        '/datas-screen': (context) => const DatasScreen()
      },
      // routes: {'/news-screen': (context) => const NewsScreen()},
    );
  }
}
