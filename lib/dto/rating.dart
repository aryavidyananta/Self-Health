class Rating {
  String comment;
  String namaPengguna;
  String namaLengkap;
  int rating;
  // ignore: non_constant_identifier_names
  dynamic IdPengguna;
  // ignore: non_constant_identifier_names
  dynamic IdDokter;

  Rating({
    required this.comment,
    required this.namaPengguna,
    required this.namaLengkap,
    required this.rating,
    // ignore: non_constant_identifier_names
    required this.IdDokter,
    // ignore: non_constant_identifier_names
    required this.IdPengguna,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        comment: json['comment'], // Ensure to handle null safely if necessary
        namaPengguna: json['nama_pengguna'],
        namaLengkap:
            json['nama_lengkap'], // Adjust key based on your API response
        rating: json['rating'] ?? 0, // Default to 0 if rating is null
        IdPengguna: json['Id_pengguna'],
        IdDokter: json['Id_dokter']);
  }
}
