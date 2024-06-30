// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:my_self/dto/dokter.dart'; // Import model Dokter
import 'package:my_self/screen/mindhaven/review.dart'; // Import screen ReviewScreen
import 'package:my_self/service/data_service.dart';
// Import DataService

class DetailDokterScreen extends StatefulWidget {
  final int idDokter;

  // ignore: use_super_parameters
  const DetailDokterScreen({Key? key, required this.idDokter})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailDokterScreenState createState() => _DetailDokterScreenState();
}

class _DetailDokterScreenState extends State<DetailDokterScreen> {
  late Future<Dokter> futureDokter;

  @override
  void initState() {
    super.initState();
    futureDokter = fetchDokter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Dokter'),
      ),
      body: FutureBuilder<Dokter>(
        future: futureDokter,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data dokter tidak ditemukan'));
          } else {
            Dokter dokter = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 20),
                itemProfile('Nama Lengkap', dokter.namaLengkap, Icons.person),
                const SizedBox(height: 20),
                itemProfile('Tempat Kerja', dokter.tempatKerja, Icons.work),
                const SizedBox(height: 20),
                itemProfile(
                    'STR', dokter.str.toString(), Icons.confirmation_number),
                const SizedBox(height: 20),
                itemProfile('Tahun Kerja', dokter.tahunKerja.toString(),
                    Icons.calendar_today),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewScreen(dokter: dokter),
                      ),
                    );
                  },
                  child: const Text('Lihat Ulasan'),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
      ),
    );
  }

  Future<Dokter> fetchDokter() async {
    try {
      // Panggil metode fetchDokter dari DataService
      List<Dokter> dokterList = await DataService.fetchDokter();
      // Cari dokter berdasarkan idDokter yang diinginkan
      Dokter dokter =
          dokterList.firstWhere((dokter) => dokter.idDokter == widget.idDokter);
      return dokter;
    } catch (e) {
      // Tangani error jika gagal mengambil data
      throw Exception('Failed to load dokter');
    }
  }
}
