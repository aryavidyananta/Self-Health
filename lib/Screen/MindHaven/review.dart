import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/AddRating.dart';
import 'package:my_self/component/reviewcard.dart'; // Adjust path to your ReviewCard component
import 'package:my_self/dto/rating.dart'; // Adjust path to your Rating model
import 'package:my_self/dto/dokter.dart'; // Adjust path to your Dokter model
import 'package:my_self/service/data_service.dart'; // Adjust path to your DataService

class ReviewScreen extends StatefulWidget {
  final Dokter dokter;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ReviewScreen({required this.dokter});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  late Future<List<Rating>> _ratingsFuture;

  @override
  void initState() {
    super.initState();
    _fetchRatings();
  }

  void _fetchRatings() {
    _ratingsFuture = DataService.fetchRating(widget.dokter.idDokter.toString());
  }

  void _addRating(Rating rating) {
    setState(() {
      _ratingsFuture =
          DataService.fetchRating(widget.dokter.idDokter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan'),
        backgroundColor: const Color.fromARGB(255, 13, 143, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Rating>>(
          future: _ratingsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('Tidak ada ulasan yang tersedia'));
            } else {
              List<Rating> ratings = snapshot.data!;
              return ListView.builder(
                itemCount: ratings.length,
                itemBuilder: (context, index) {
                  return ReviewCard(rating: ratings[index]);
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRating = await Navigator.push<Rating>(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddRatingScreen(idDokter: widget.dokter.idDokter),
            ),
          );
          if (newRating != null) {
            _addRating(newRating);
          }
        },
        backgroundColor: const Color.fromARGB(255, 13, 143, 134),
        child: const Icon(Icons.add),
      ),
    );
  }
}
