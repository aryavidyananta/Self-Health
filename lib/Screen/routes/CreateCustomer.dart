// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:my_self/Screen/routes/CustomerScreen.dart';
import 'package:my_self/endpoints/endpoints.dart';

class FormCustomerService extends StatefulWidget {
  // ignore: use_super_parameters
  const FormCustomerService({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormCustomerServiceState createState() => _FormCustomerServiceState();
}

class _FormCustomerServiceState extends State<FormCustomerService> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  File? _galleryFile;
  final _picker = ImagePicker();
  double _rating = 0;
  //final _divisionTargetNameController = TextEditingController();
  final _idDivisonTargetController = TextEditingController();
  final _idpriorityController = TextEditingController();
  String? _selecteddivisionTargetController;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _galleryFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _postDataWithImage(BuildContext context) async {
    if (_galleryFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    var request =
        MultipartRequest('POST', Uri.parse(Endpoints.CustomerService));
    request.fields['title_issues'] = _titleController.text;
    request.fields['description_issues'] = _descController.text;
    request.fields['rating'] = _rating.toString();
    request.fields['division_departement_name'] =
        _selecteddivisionTargetController ?? '';

    // request.fields['division_departement_name'] =
    //     _divisionTargetNameController.text;
    request.fields['id_division_target'] = _idDivisonTargetController.text;
    request.fields['id_priority'] = _idpriorityController.text; // Category

    var multipartFile =
        await MultipartFile.fromPath('image', _galleryFile!.path);
    request.files.add(multipartFile);

    request.send().then((response) {
      // Handle response (success or error)
      if (response.statusCode == 201) {
        debugPrint('Data and image posted successfully!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const CustomerServiceScreen()),
        );
      } else {
        debugPrint('Error posting data: ${response.statusCode}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Data',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    _showPicker(context: context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      color: const Color.fromARGB(255, 121, 183, 255),
                    ),
                    width: double.infinity,
                    height: 150,
                    child: _galleryFile == null
                        ? Center(
                            child: Text(
                              'Pilih Gambar',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Image.file(_galleryFile!),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Title',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(81, 171, 255, 0.004)
                        .withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Judul",
                    hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(179, 0, 0, 0)),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Deskripsi',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _descController,
                  maxLength: 150,
                  maxLines: 4,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(81, 171, 255, 0.004)
                        .withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Masukkan Deskripsi",
                    hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(179, 0, 0, 0)),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rating',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8),
                RatingBar(
                  initialRating: _rating,
                  minRating: 1,
                  maxRating: 5,
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: const Icon(
                      Icons.star_border,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                const SizedBox(height: 24),
                const SizedBox(height: 8),
                Text(
                  'Division',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _idDivisonTargetController,
                  maxLength: 50,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(81, 171, 255, 0.004)
                        .withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "",
                    hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(179, 0, 0, 0)),
                  ),
                ),
                Text(
                  'Priority',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _idpriorityController,
                  maxLength: 50,
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(81, 171, 255, 0.004)
                        .withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "",
                    hintStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(179, 0, 0, 0)),
                  ),
                ),
                // Text(
                //   'Select Priority',
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: const Color.fromARGB(255, 0, 0, 0)),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 138, 255),
        tooltip: 'Simpan',
        onPressed: () {
          _postDataWithImage(context);
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }

  void _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
