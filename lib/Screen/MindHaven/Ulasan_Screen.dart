// ignore_for_file: file_names, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UlasanScreen extends StatelessWidget {
  const UlasanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan Dokter'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UlasanItem(
            namaPengulas: 'John Doe',
            komentar: 'Dokter yang sangat baik dan profesional.',
            rating: 4,
          ),
          const SizedBox(height: 16),
          const UlasanItem(
            namaPengulas: 'Jane Smith',
            komentar: 'Penjelasannya sangat detail dan membantu.',
            rating: 5,
          ),
          const SizedBox(height: 16),
          const UlasanItem(
            namaPengulas: 'Sam Wilson',
            komentar: 'Pelayanan yang ramah dan cepat.',
            rating: 3,
          ),
        ],
      ),
    );
  }
}

class UlasanItem extends StatelessWidget {
  final String namaPengulas;
  final String komentar;
  final int rating;

  const UlasanItem({
    super.key,
    required this.namaPengulas,
    required this.komentar,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            namaPengulas,
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(komentar),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
