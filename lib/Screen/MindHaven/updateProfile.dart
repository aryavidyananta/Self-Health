// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_self/cubit/datalogin/data_login_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  final Function(String, String, String) updateUserDataCallback;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  EditProfileScreen(
      {required this.userData, required this.updateUserDataCallback});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _namaLengkapController;
  late TextEditingController _alamatController;
  late TextEditingController _noHpController;

  @override
  void initState() {
    super.initState();
    _namaLengkapController =
        TextEditingController(text: widget.userData['nama_pengguna']);
    _alamatController = TextEditingController(text: widget.userData['email']);
    _noHpController = TextEditingController(text: widget.userData['No_Telpn']);
  }

  Future<void> _updateUserData() async {
    final profile = context.read<DataLoginCubit>();
    final currentState = profile.state;

    int idUser = currentState.IdPengguna;

    try {
      final response = await http.put(
        Uri.parse('http://192.168.173.41:5000/api/v1/user/update/$idUser'),
        body: {
          'nama_pengguna': _namaLengkapController.text,
          'email': _alamatController.text,
          'No_Telpn': _noHpController.text,
        },
      );

      if (response.statusCode == 200) {
        widget.updateUserDataCallback(
          _namaLengkapController.text,
          _alamatController.text,
          _noHpController.text,
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            // ignore: unnecessary_const
            const SnackBar(content: const Text('Data updated successfully')));
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update data')));
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaLengkapController,
              decoration: const InputDecoration(labelText: 'Nama Pengguna'),
            ),
            TextField(
              controller: _alamatController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _noHpController,
              decoration: const InputDecoration(labelText: 'No HP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUserData,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
