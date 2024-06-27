import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:my_self/service/data_service.dart';

// ignore: use_key_in_widget_constructors
class AddAudioScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AddAudioScreenState createState() => _AddAudioScreenState();
}

class _AddAudioScreenState extends State<AddAudioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaAudioController = TextEditingController();
  final _keteranganController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _namaAudioController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      bool success = await DataService.tambahAudio(
        _keteranganController.text,
        _namaAudioController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (success) {
        _showSuccessDialog();
        _namaAudioController.clear();
        _keteranganController.clear();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add audio')),
        );
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: const Column(
            children: [
              // ignore: unnecessary_const
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 10),
              Text('Success'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Ada Meditasi Baru?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _namaAudioController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Meditasi',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'masukan nama meditasi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _keteranganController,
                        decoration: const InputDecoration(
                          labelText: 'Keterangan',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: const Text(
                                'Tambah',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
