import 'package:flutter/material.dart';
import 'package:my_self/Screen/MindHaven/ReadMeditasi.dart';
import 'package:my_self/dto/audio.dart'; // Sesuaikan dengan path yang sesuai dengan struktur proyek Anda
import 'package:my_self/service/data_service.dart'; // Sesuaikan dengan service untuk mengambil audio

// ignore: use_key_in_widget_constructors
class QuietFlowScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _QuietFlowScreenState createState() => _QuietFlowScreenState();
}

class _QuietFlowScreenState extends State<QuietFlowScreen> {
  List<Audio> audioList =
      []; // List untuk menyimpan audio yang diambil dari service
  bool isLoading = false;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    fetchAudioData(); // Panggil method untuk mengambil data audio saat widget pertama kali dibuat
  }

  Future<void> fetchAudioData() async {
    setState(() {
      isLoading = true; // Menandakan sedang memuat data
      errorText = ''; // Reset pesan error jika sebelumnya terjadi error
    });

    try {
      List<Audio> fetchedAudioList = await DataService.fetchAudio();
      setState(() {
        audioList =
            fetchedAudioList; // Simpan hasilnya ke dalam state agar widget dapat diperbarui
        isLoading = false; // Selesai memuat data
      });
    } catch (e) {
      setState(() {
        errorText =
            'Failed to load audio: $e'; // Set pesan error dengan detail exception
        isLoading = false; // Selesai memuat data dengan error
      });
      // ignore: avoid_print
      print('Error fetching audio: $e');
      // Tampilkan pesan error jika terjadi masalah saat mengambil data audio
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiet Flow'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator() // Tampilkan indicator loading jika sedang memuat
            : errorText.isNotEmpty
                ? Text(errorText) // Tampilkan pesan error jika terjadi error
                : audioList.isEmpty
                    ? const Text(
                        'No audio available') // Tampilkan pesan jika tidak ada data audio
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: audioList.length,
                              itemBuilder: (context, index) {
                                Audio audio = audioList[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/ger 33.jpg',
                                        height: 300,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        audio.namaAudioMeditas,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        audio
                                            .keterangan, // Menampilkan keterangan audio
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Navigasi ke layar detail atau aksi lainnya
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailAudioScreen(
                                                        audio: audio)),
                                          );
                                        },
                                        // ignore: sort_child_properties_last
                                        child: const Text('Baca Selengkapnya'),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                          textStyle:
                                              const TextStyle(fontSize: 16),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
      ),
    );
  }
}
