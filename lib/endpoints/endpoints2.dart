// dto/endpoints.dart
class Endpoints2 {
  static String baseURLLive = "http://192.168.18.206:5000";

  // Function to update baseURL
  static void updateBaseURL(String url) {
    baseURLLive = url;
  }

  static String get dokter => "$baseURLLive/api/v1/dokter/read";
  static String get jurnal => "$baseURLLive/api/v1/jurnal/read";
  static String get tambahJurnal =>
      "$baseURLLive/api/v1/jurnal/create"; // Update the create endpoint
  static String get notes => "$baseURLLive/api/v1/notes/read";
  static String get tambahNotes => "$baseURLLive/api/v1/notes/create";
  static String get tambahRating => "$baseURLLive/api/v1/rating/create";
  static String get deleteNoteById => "$baseURLLive/api/v1/notes/delete/";
  static String get audio => "$baseURLLive/api/v1/audio_meditasi/read";
  // ignore: constant_identifier_names, non_constant_identifier_names
  static String get TambahQuiet => "$baseURLLive/api/v1/audio_meditasi/create";

  static String get rating => "$baseURLLive/api/v1/rating/read";
  static String get dokterBy => "$baseURLLive/api/v1/dokter/read_by_dokter";

  static String get user => "$baseURLLive/api/v1/user";
  static String get dataLogin => "$baseURLLive/api/v1/auth/login";
  static String get register => "$baseURLLive/api/v1/auth/register";
  static String get login => "$baseURLLive/api/v1/protected/data";

  static String get readUserById => "$baseURLLive/api/v1/user/read_by_user";
  static String get updateUser => "$baseURLLive/api/v1/user/update";
  static String get uploadUserPhoto => "$baseURLLive/api/v1/user/upload";
  static String get getUserPhoto => "$baseURLLive/api/v1/user/photo";
}
