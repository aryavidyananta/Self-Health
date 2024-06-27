// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/dto/notes.dart';

class DetailNoteScreen extends StatelessWidget {
  final Notes note;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  DetailNoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              note.deskripsi,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
