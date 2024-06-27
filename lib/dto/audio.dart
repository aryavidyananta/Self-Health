class Audio {
  int idAudioMeditasi;
  String keterangan;
  String namaAudioMeditas;

  Audio({
    required this.idAudioMeditasi,
    required this.keterangan,
    required this.namaAudioMeditas,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      idAudioMeditasi:
          json['id_audio_meditasi'] ?? 0, // Menggunakan nilai default jika null
      namaAudioMeditas: json['nama_audio_meditas'] ?? '',
      keterangan: json['Keterangan'] ?? '',
    );
  }
}
