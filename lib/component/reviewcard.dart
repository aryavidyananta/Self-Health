import 'package:flutter/material.dart';
import 'package:my_self/dto/rating.dart'; // Ganti dengan path yang sesuai

class ReviewCard extends StatelessWidget {
  final Rating rating;

  // ignore: use_super_parameters
  const ReviewCard({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rating.comment,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'By: ${rating.namaPengguna}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
