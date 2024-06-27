// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/dto/jurnal.dart'; // Sesuaikan dengan lokasi model jurnal Anda

class JurnalDetailScreen extends StatelessWidget {
  final Jurnal jurnal;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  JurnalDetailScreen({required this.jurnal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Jurnal'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              jurnal.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              jurnal.deskripsi,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
