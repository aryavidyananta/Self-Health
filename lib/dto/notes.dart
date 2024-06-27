class Notes {
  int idNotes;
  String deskripsi;
  String title;

  Notes({
    required this.idNotes,
    required this.deskripsi,
    required this.title,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        idNotes: json["id_notes"],
        deskripsi: json["deskripsi"],
        title: json["title"],
      );

  get id => null;
}
