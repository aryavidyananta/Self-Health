import 'package:flutter/material.dart';
import 'package:my_self/dto/dokter.dart'; // Import your Dokter model
// Assuming this is your detail screen

class DoctorItem extends StatelessWidget {
  final Dokter dokter;

  // ignore: use_super_parameters
  const DoctorItem({Key? key, required this.dokter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
              'assets/images/master.jpg'), // Placeholder image or dokter's image
        ),
        title: Text(
          dokter.namaLengkap,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Tempat Kerja: ${dokter.tempatKerja}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  dokter.tahunKerja.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: GestureDetector(
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lihat Profil',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
