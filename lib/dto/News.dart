import 'dart:ffi';

class news {
  final String id;
  final String title;
  final String body;

  news({required this.id, required this.title, required this.body});

  factory news.fromJson(Map<String, dynamic> json) =>
      news(id: json['id'], title: json['title'], body: json['body']);
}
