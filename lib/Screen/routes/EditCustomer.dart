// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_self/Screen/routes/CustomerScreen.dart';

import 'package:my_self/dto/CustomerService.dart';
import 'package:my_self/endpoints/endpoints.dart';

class EditScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const EditScreen({Key? key, required this.issues}) : super(key: key);

  final CustomerService issues;

  @override
  // ignore: library_private_types_in_public_api
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _idDivisonTargetController = TextEditingController();
  final _idpriorityController = TextEditingController();

  File? galleryFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.issues.titleIssues;
    _descController.text = widget.issues.descriptionIssues;
  }

  _showPicker({
    required BuildContext context,
  }) {
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
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  Future<void> _updateDataWithImage(BuildContext context) async {
    if (galleryFile == null) {
      return; // Handle case where no image is selected
    }

    var request = MultipartRequest(
        'POST',
        Uri.parse(
            '${Endpoints.CustomerService}/${widget.issues.idCustomerService}'));
    request.fields['title_issues'] = _titleController.text;
    request.fields['description_issues'] = _descController.text;
    request.fields['rating'] = rating.toString();
    if (galleryFile != null) {
      var multipartFile = await MultipartFile.fromPath(
        'image', // ganti field sesui in
        galleryFile!.path,
      );
      request.files.add(multipartFile);
    }
    request.fields['id_division_target'] = _idDivisonTargetController.text;
    request.fields['id_priority'] = _idpriorityController.text;

    request.send().then((response) {
      // Handle response (success or error)
      if (response.statusCode == 200) {
        debugPrint('Data and image posted successfully!');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const CustomerServiceScreen()));
      } else {
        debugPrint('Error posting data: ${response.statusCode}');
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose(); // Dispose of controller when widget is removed
    _descController.dispose();
    super.dispose();
  }

  double rating = 0;
  void ratingUpdate(double userRating) {
    setState(() {
      rating = userRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
        backgroundColor: const Color.fromRGBO(4, 73, 153, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Submit Update\nData!',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(4, 73, 153, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Masukkan Judul',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Judul",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Masukkan Deskripsi',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _descController,
                maxLength: 150,
                maxLines: 4,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Deskripsi",
                ),
              ),
              Text(
                'Rating',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                initialRating: widget.issues.rating.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 30,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.blueGrey,
                ),
                onRatingUpdate: ratingUpdate,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Masukkan Attachment!',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showPicker(context: context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.grey.shade200,
                  ),
                  width: double.infinity,
                  height: 150,
                  child: galleryFile == null
                      ? Center(
                          child: Image.network(
                            width: 200,
                            Uri.parse(
                                    '${Endpoints.baseURLLive}/public/${widget.issues.imageUrl!}')
                                .toString(),
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        )
                      : Center(
                          child: Image.file(galleryFile!),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Divison',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: _idDivisonTargetController,
                maxLength: 50,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "angka",
                ),
              ),
              Text(
                'Priority',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: _idpriorityController,
                maxLength: 50,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "angka",
                ),
              ), // Tambahkan jarak antara attachment dan floating action button
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(4, 73, 153, 1),
        tooltip: 'Increment',
        onPressed: () {
          _updateDataWithImage(context);
        },
        child: const Icon(Icons.save_alt, color: Colors.white, size: 28),
      ),
    );
  }
}
