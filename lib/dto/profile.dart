class Profile {
  final int idpengguna;
  final String? namapengguna;
  final String? email;
  final String? noHp;
  final String? username;
  final String? foto;

  Profile({
    required this.idpengguna,
    this.namapengguna,
    this.email,
    this.noHp,
    this.username,
    this.foto,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      idpengguna: json['Id_pengguna'],
      namapengguna: json['nama_pengguna'],
      email: json['email'],
      noHp: json['No_Telpn'],
      username: json['username'],
      foto: json['foto'],
    );
  }

  Profile copyWith({
    int? idpengguna,
    String? namaLengkap,
    String? alamat,
    String? noHp,
    String? username,
    String? foto,
  }) {
    return Profile(
      idpengguna: idpengguna ?? this.idpengguna,
      // ignore: unnecessary_this
      namapengguna: namaLengkap ?? this.namapengguna,
      // ignore: unnecessary_this
      email: email ?? this.email,
      noHp: noHp ?? this.noHp,
      username: username ?? this.username,
      foto: foto ?? this.foto,
    );
  }
}
