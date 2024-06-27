// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_self/Screen/DetailScreen.dart';
import 'package:my_self/dbhelper/Db_helper.dart'; // Pastikan Db_helper sudah diimpor dengan benar
// Import detail_screen.dart sesuai dengan struktur proyek Anda

class AddTypes extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddTypes({Key? key});

  @override
  State<AddTypes> createState() => _AddTypesState();
}

class _AddTypesState extends State<AddTypes> {
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _addData() async {
    await SQLHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _updateData(int id) async {
    await SQLHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }

  void _deleteData(int id) async {
    await SQLHelper.deleteData(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text("Data Deleted"),
    ));
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void showBottomSheet(int? id) async {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['description'];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await _addData();
                  } else {
                    await _updateData(id);
                  }

                  _titleController.text = "";
                  _descController.text = "";

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  // ignore: avoid_print
                  print("Data Added/Updated");
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    id == null ? "Add Data" : "Update",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateToDetailScreen(int id) {
    final selectedData = _allData.firstWhere((element) => element['id'] == id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(data: selectedData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEAF4),
      appBar: AppBar(
        title: const Text("CRUD"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    navigateToDetailScreen(_allData[index]['id']);
                  },
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        _allData[index]['title'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    subtitle: Text(_allData[index]['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showBottomSheet(_allData[index]['id']);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.indigo,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteData(_allData[index]['id']);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
