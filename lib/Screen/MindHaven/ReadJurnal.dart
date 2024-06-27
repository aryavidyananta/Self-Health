// Screen/MindHaven/ReadJurnalScreen.dart
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/JurnalDetail.dart';
import 'package:my_self/Screen/MindHaven/TambahJurnal.dart';
import 'package:my_self/dto/jurnal.dart';
import 'package:my_self/service/data_service.dart';

// ignore: use_key_in_widget_constructors
class ReadJurnalScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ReadJurnalScreenState createState() => _ReadJurnalScreenState();
}

class _ReadJurnalScreenState extends State<ReadJurnalScreen> {
  late Future<List<Jurnal>> _futureJurnals;

  @override
  void initState() {
    super.initState();
    _futureJurnals = DataService.fetchJurnal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Jurnal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddJurnalScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Jurnal>>(
          future: _futureJurnals,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Tidak ada data jurnal yang tersedia.'),
              );
            } else {
              List<Jurnal> jurnals = snapshot.data!;
              return ListView.builder(
                itemCount: jurnals.length,
                itemBuilder: (context, index) {
                  Jurnal jurnalItem = jurnals[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JurnalDetailScreen(
                            jurnal: jurnalItem,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 189, 196, 46), // Warna background container
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            jurnalItem.title,
                            style: const TextStyle(
                              color: Color.fromARGB(
                                  255, 0, 0, 0), // Warna teks judul
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Nama Pembuat: ${jurnalItem.namapembuat ?? "Tidak diketahui"}', // Menggunakan atribut namaPembuat dari DTO
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JurnalDetailScreen(
                                        jurnal: jurnalItem,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Baca Selengkapnya',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 149, 255),
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar Jurnal',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah Jurnal',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddJurnalScreen()),
            );
          }
        },
      ),
    );
  }
}
