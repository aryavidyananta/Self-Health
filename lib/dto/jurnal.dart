class Jurnal {
  int idJurnal;
  int idPengguna;
  String deskripsi;
  String title;
  String? namapembuat;

  Jurnal(
      {required this.idJurnal,
      required this.idPengguna,
      required this.deskripsi,
      required this.title,
      required this.namapembuat});

  factory Jurnal.fromJson(Map<String, dynamic> json) => Jurnal(
      idJurnal: json["Id_jurnal"],
      idPengguna: json["Id_pengguna"],
      deskripsi: json["deskripsi"],
      title: json["title"],
      namapembuat: json["nama_pengguna"]);
}
