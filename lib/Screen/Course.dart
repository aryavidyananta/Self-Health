// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/ProfilDokterScreen.dart';
import 'package:my_self/dto/dokter.dart';
import 'package:my_self/component/dokter_item.dart';
import 'package:my_self/service/data_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorListScreen(),
      routes: {},
    );
  }
}

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  late Future<List<Dokter>> futureDokterList;
  final TextEditingController _searchController = TextEditingController();
  List<Dokter> _allDokter = [];
  List<Dokter> _filteredDokter = [];
  String _orderBy = 'ASC'; // Default order

  @override
  void initState() {
    super.initState();
    _fetchDokter();
    _searchController.addListener(_filterDokter);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchDokter() {
    futureDokterList = DataService.fetchDokterByYear('2024', orderBy: _orderBy);
  }

  void _filterDokter() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredDokter = _allDokter;
      } else {
        _filteredDokter = _allDokter.where((dokter) {
          return dokter.namaLengkap
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
        }).toList();
      }
    });
  }

  void _onOrderChanged(String orderBy) {
    setState(() {
      _orderBy = orderBy;
      _fetchDokter();
    });
  }

  void navigateToDetailScreen(int idDokter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDokterScreen(idDokter: idDokter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari dokter...',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () => _onOrderChanged('ASC'),
                  color: _orderBy == 'ASC' ? Colors.blue : Colors.black,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () => _onOrderChanged('DESC'),
                  color: _orderBy == 'DESC' ? Colors.blue : Colors.black,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Dokter>>(
              future: futureDokterList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No doctors available'));
                } else {
                  _allDokter = snapshot.data!;
                  _filteredDokter = _searchController.text.isEmpty
                      ? _allDokter
                      : _allDokter.where((dokter) {
                          return dokter.namaLengkap
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase());
                        }).toList();
                  return ListView.builder(
                    itemCount: _filteredDokter.length,
                    itemBuilder: (context, index) {
                      Dokter dokter = _filteredDokter[index];
                      return InkWell(
                        onTap: () {
                          navigateToDetailScreen(dokter.idDokter);
                        },
                        child: DoctorItem(dokter: dokter),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
