// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/dto/audio.dart';

class DetailAudioScreen extends StatelessWidget {
  final Audio audio;

  // ignore: use_super_parameters
  const DetailAudioScreen({Key? key, required this.audio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Meditasi'),
        backgroundColor: const Color.fromARGB(255, 13, 143, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              audio.namaAudioMeditas,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              audio.keterangan,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
