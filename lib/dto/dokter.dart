class Dokter {
  dynamic idDokter;
  String namaLengkap;
  int str;
  String foto;
  int tahunKerja;
  String tempatKerja;

  Dokter(
      {required this.idDokter,
      required this.namaLengkap,
      required this.str,
      required this.foto,
      required this.tahunKerja,
      required this.tempatKerja});

  factory Dokter.fromJson(Map<String, dynamic> json) => Dokter(
      idDokter: json["Id_dokter"],
      namaLengkap: json["nama_lengkap"],
      str: json["STR"],
      foto: json["foto"],
      tahunKerja: json["tahun_kerja"],
      tempatKerja: json['tempat_kerja']);

  get rating => null;
}
