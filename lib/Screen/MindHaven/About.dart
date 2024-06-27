// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                child: Image.asset("assets/images/Logomind.png"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              _buildSectionTitle('Deskripsi'),
              const SizedBox(height: 10),
              const Text(
                'Sesuaikan diri menurut versi terbaikmu. Ungkapkan semua cerita yang kamu miliki. Kami menjaga semua rahasia statusmu.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildSectionTitle('Developer'),
              const SizedBox(height: 10),
              const Text(
                'MindHaven Developer Team',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      // ignore: prefer_const_constructors
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
