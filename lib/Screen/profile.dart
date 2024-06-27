// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_self/cubit/datalogin/data_login_cubit.dart';
import 'package:my_self/dto/profile.dart';
import 'package:my_self/endpoints/endpoints2.dart';
import 'package:my_self/service/data_service.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  Profile? userData;
  String errorMessage = '';
  File? _imageFile;
  final DataService dataService = DataService();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    setState(() {
      isLoading = true;
    });

    final profile = context.read<DataLoginCubit>();
    final currentState = profile.state;
    int idpengguna = currentState.IdPengguna;

    try {
      userData = await DataService.fetchUserData(idpengguna);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> updateUserData(
      String namaLengkap, String email, String noHp) async {
    final profile = context.read<DataLoginCubit>();
    final currentState = profile.state;
    int idpengguna = currentState.IdPengguna;

    try {
      await DataService.updateUserData(idpengguna, namaLengkap, email, noHp);
      setState(() {
        userData = userData?.copyWith(
          namaLengkap: namaLengkap,
          alamat: email,
          noHp: noHp,
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil diperbarui')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    final profile = context.read<DataLoginCubit>();
    final currentState = profile.state;
    int idpengguna = currentState.IdPengguna;

    if (_imageFile == null) return;

    try {
      await DataService.uploadImage(idpengguna, _imageFile!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gambar berhasil diunggah')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  void _showEditDialog() {
    final TextEditingController namaLengkapController =
        TextEditingController(text: userData?.namapengguna);
    final TextEditingController emailController =
        TextEditingController(text: userData?.email);
    final TextEditingController noHpController =
        TextEditingController(text: userData?.noHp);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaLengkapController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Alamat'),
              ),
              TextField(
                controller: noHpController,
                decoration: const InputDecoration(labelText: 'No HP'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                updateUserData(
                  namaLengkapController.text,
                  emailController.text,
                  noHpController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 0, 168, 112),
                          Color.fromARGB(255, 0, 255, 179),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Pilih Sumber Gambar'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _pickImage(ImageSource.gallery);
                                      },
                                      child: const Text('Galeri'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        _pickImage(ImageSource.camera);
                                      },
                                      child: const Text('Kamera'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              _imageFile == null
                                  ? (userData?.foto != null
                                      ? ClipOval(
                                          child: Image.network(
                                            '${Endpoints2.getUserPhoto}/${userData!.idpengguna}',
                                            width: 160,
                                            height: 160,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              );
                                            },
                                          ),
                                        )
                                      : const CircleAvatar(
                                          radius: 80,
                                          backgroundColor: Colors.purple,
                                          child: Icon(
                                            Icons.person,
                                            size: 80,
                                            color: Colors.white,
                                          ),
                                        ))
                                  : ClipOval(
                                      child: Image.file(
                                        _imageFile!,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.indigoAccent,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userData?.username ?? '-',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildProfileItem(
                                  Icons.person_outline,
                                  'Nama Lengkap',
                                  userData?.namapengguna,
                                ),
                                _buildProfileItem(
                                  Icons.phone,
                                  'No HP',
                                  userData?.noHp,
                                ),
                                _buildProfileItem(
                                  Icons.home,
                                  'Alamat',
                                  userData?.email,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _showEditDialog,
                              icon: const Icon(Icons.edit),
                              label: const Text('Edit Profil'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.indigoAccent,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.indigoAccent,
            size: 30,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value ?? '-',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
