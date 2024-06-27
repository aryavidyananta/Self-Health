// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/dto/rating.dart';
import 'package:my_self/service/data_service.dart';

class AddRatingScreen extends StatefulWidget {
  final int idDokter;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AddRatingScreen({required this.idDokter});

  @override
  // ignore: library_private_types_in_public_api
  _AddRatingScreenState createState() => _AddRatingScreenState();
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  final _namaPenggunaController = TextEditingController();
  final _namaLengkapController = TextEditingController();
  final _idPenggunaController = TextEditingController();
  int _rating = 0;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final rating = Rating(
        comment: _commentController.text,
        namaPengguna: _namaPenggunaController.text,
        namaLengkap: _namaLengkapController.text,
        rating: _rating,
        IdPengguna: _idPenggunaController.text,
        IdDokter: widget.idDokter,
      );

      final success = await DataService.createRating(rating);
      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context, rating);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add rating')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 13, 143, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Rating Dokter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 13, 143, 134),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Komentar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inputkan Komentar';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // TextFormField(
              //   controller: _namaPenggunaController,
              //   decoration: InputDecoration(
              //     labelText: 'Nama Pengguna',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.grey[200],
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter a username';
              //     }
              //     return null;
              //   },
              // ),

              // TextFormField(
              //   controller: _namaLengkapController,
              //   decoration: InputDecoration(
              //     labelText: 'Nama Lengkap',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     filled: true,
              //     fillColor: Colors.grey[200],
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your full name';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _idPenggunaController,
                decoration: InputDecoration(
                  labelText: 'Id Pengguna',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the user ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 13, 143, 134),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _namaPenggunaController.dispose();
    _namaLengkapController.dispose();
    _idPenggunaController.dispose();
    super.dispose();
  }
}
