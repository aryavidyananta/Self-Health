// ignore_for_file: unused_import, file_names

import 'dart:ffi';

// ignore: camel_case_types
class news {
  final String id;
  final String title;
  final String body;

  news({required this.id, required this.title, required this.body});

  factory news.fromJson(Map<String, dynamic> json) =>
      news(id: json['id'], title: json['title'], body: json['body']);
}
