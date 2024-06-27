// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/quietflow.dart';
// ignore: unused_import
import 'package:my_self/Screen/MindHaven/relaxition.dart';

// ignore: use_key_in_widget_constructors
class MeditasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/duduk.png", // Tambahkan gambar ini ke folder assets Anda
                  height: 700,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuietFlowScreen()),
                      );
                    },
                    // ignore: sort_child_properties_last
                    child: const Text('Quiet Flow'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.lightBlueAccent,
                      textStyle: const TextStyle(fontSize: 18),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
