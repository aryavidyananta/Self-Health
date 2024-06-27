import 'dart:io';

import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_self/component/constant.dart';
import 'package:my_self/component/secure_storage_utils.dart';
import 'package:my_self/dto/Balance.dart';
import 'package:my_self/dto/CustomerService.dart';
import 'package:my_self/dto/Spending.dart';
import 'package:my_self/dto/audio.dart';
import 'package:my_self/dto/datalogin.dart';
import 'dart:convert';
import 'package:my_self/dto/datas.dart';
import 'package:my_self/dto/dokter.dart';
import 'package:my_self/dto/jurnal.dart';
import 'package:my_self/dto/notes.dart';
import 'package:my_self/dto/profile.dart';
import 'package:my_self/dto/rating.dart';
import 'package:my_self/dto/user.dart';
import 'package:my_self/endpoints/endpoints.dart';
import 'package:my_self/endpoints/endpoints2.dart';

// ignore: unused_import
import 'package:my_self/mahasiswa/dto/news.dart';

class DataService {
  // static Future<List<News>> fetchNews() async {
  //   final response = await http.get(Uri.parse(Endpoints.news));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonResponse = jsonDecode(response.body);
  //     return jsonResponse.map((item) => News.fromJson(item)).toList();
  //   } else {
  //     // Handle error
  //     throw Exception('Failed to load news');
  //   }
  // }

  static Future<List<Datas>> fetchDatas() async {
    final response = await http.get(Uri.parse(Endpoints.datas));
    debugPrint('here0');
    if (response.statusCode == 200) {
      debugPrint('here');
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Datas.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<List<CustomerService>> fetchCustomerService() async {
    final response = await http.get(Uri.parse(Endpoints.CustomerService));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => CustomerService.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load datas');
    }
  }

  static Future<void> deleteCustomerService(int idCustomerService) async {
    await http.delete(
        Uri.parse('${Endpoints.CustomerService}/$idCustomerService'),
        headers: {'Content-type': 'aplication/json'});
  }

  static Future<List<Balances>> fetchbalances() async {
    final response = await http.get(Uri.parse(Endpoints.balance));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Balances.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load news');
    }
  }

  static Future<List<Spendings>> fetchSpendings() async {
    final response = await http.get(Uri.parse(Endpoints.spending));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Spendings.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load news');
    }
  }

  static Future<List<Dokter>> fetchDokter() async {
    final response = await http.get(Uri.parse(Endpoints2.dokter));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Dokter.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  static Future<bool> tambahJurnal(
      String title, String deskripsi, dynamic idPengguna) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints2.tambahJurnal),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {
          'title': title,
          'deskripsi': deskripsi,
          'Id_pengguna': idPengguna.toString(),
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during tambahJurnal: $e');
      return false;
    }
  }

  static Future<List<Jurnal>> fetchJurnal() async {
    final response = await http.get(Uri.parse(Endpoints2.jurnal));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Jurnal.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load jurnals');
    }
  }

  static Future<List<Audio>> fetchAudio() async {
    final response = await http.get(Uri.parse(Endpoints2.audio));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['datas'] != null) {
        return (data['datas'] as List<dynamic>)
            .map((item) => Audio.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('No audio data available');
      }
    } else {
      throw Exception('Failed to load audio');
    }
  }

  static Future<bool> tambahAudio(
      String keterangan, String namaAudioMeditas) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints2.TambahQuiet),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {
          'nama_audio_meditas': namaAudioMeditas,
          'Keterangan': keterangan,
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during tambahJurnal: $e');
      return false;
    }
  }

  static Future<http.Response> sendSpendingData(int spending) async {
    final url = Uri.parse(Endpoints.spending);
    final data = {'spending': spending};

    final response = await http.post(
      url,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  //post login with emain and password

  static Future<http.Response> sendLoginData(
      String username, String password) async {
    final url = Uri.parse(Endpoints2.dataLogin); // Replace with your endpoint
    final data = {'username': username, 'password': password};

    try {
      final response = await http.post(
        url,
        body: data,
      );
      return response;
    } catch (e) {
      debugPrint("Error during http.post: $e");
      // Return a response with an appropriate error status code or message
      return http.Response('Error', 500);
    }
  }

  static Future<http.Response> logoutData() async {
    final url = Uri.parse(Endpoints.logout);
    final String? accessToken =
        await SecureStorageUtil.storage.read(key: tokenStoreName);
    debugPrint("logout with $accessToken");

    final response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    });

    return response;
  }

  static Future<dataLogin> fetchProfile(String? accessToken) async {
    accessToken ??= await SecureStorageUtil.storage.read(key: tokenStoreName);

    final response = await http.get(
      Uri.parse(Endpoints2.login),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    debugPrint('Profile response: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse;
      try {
        jsonResponse = jsonDecode(response.body);
      } catch (e) {
        throw Exception('Failed to parse JSON: $e');
      }

      try {
        return dataLogin.fromJson(jsonResponse);
      } catch (e) {
        throw Exception('Failed to parse Profile: $e');
      }
    } else {
      // Handle error
      throw Exception(
          'Failed to load Profile with status code: ${response.statusCode}');
    }
  }

  //post data to endpoint news
  static Future<User> createUser(String password, String username) async {
    final body = jsonEncode(<String, String>{
      // 'nama_pengguna': namaPengguna,
      // 'No_Telpn': noTelpn, // Ensure this matches the server's expectation
      // 'email': email,
      'username': username,
      'password': password,
    });

    // ignore: avoid_print
    print("Request Body: $body"); // Debugging: Print request body

    final response = await http.post(
      Uri.parse(Endpoints2.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    // ignore: avoid_print
    print(
        "Response Status: ${response.statusCode}"); // Debugging: Print response status
    // ignore: avoid_print
    print("Response Body: ${response.body}"); // Debugging: Print response body

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse);
    } else {
      switch (response.statusCode) {
        case 400:
          throw Exception('Bad request: Invalid data');
        case 401:
          throw Exception('Unauthorized: Authentication failure');
        default:
          throw Exception('Failed to create user: ${response.statusCode}');
      }
    }
  }

  static Future<bool> tambahNotes(String title, String deskripsi) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints2.tambahNotes),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {
          'title': title,
          'deskripsi': deskripsi,
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during tambahNotes: $e');
      return false;
    }
  }

  static Future<List<Notes>> fetchNotes() async {
    final response = await http.get(Uri.parse(Endpoints2.notes));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Notes.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load jurnals');
    }
  }

  static Future<List<Rating>> fetchRating(String idDokter) async {
    final url = Uri.parse(
        '${Endpoints2.rating}?Id_dokter=$idDokter'); // Adjust according to your endpoint structure
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body)['datas'];
      List<Rating> ratings =
          responseData.map((item) => Rating.fromJson(item)).toList();
      return ratings;
    } else {
      throw Exception('Failed to load ratings');
    }
  }

  static Future<bool> tambahRating(String comment, int rating) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints2.tambahRating),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {
          'comment': comment,
          'rating': rating.toString(), // Konversi rating ke String
        },
      );

      if (response.statusCode == 201) {
        return true; // Berhasil menambahkan rating
      } else {
        return false; // Gagal menambahkan rating
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during tambahRating: $e');
      return false; // Exception terjadi
    }
  }

  static Future<bool> deleteNoteById(int idNotes) async {
    try {
      final response = await http.delete(
        Uri.parse('${Endpoints2.deleteNoteById}$idNotes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return true; // Deleted successfully
      } else {
        throw Exception('Failed to delete note: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during deleteNoteById: $e');
      return false; // Return false for failure
    }
  }

  static Future<bool> createRating(Rating rating) async {
    final Map<String, String> requestPayload = {
      'comment': rating.comment,
      'nama_pengguna': rating.namaPengguna,
      'nama_lengkap': rating.namaLengkap,
      'rating': rating.rating.toString(),
      'Id_pengguna': rating.IdPengguna.toString(),
      'Id_dokter': rating.IdDokter.toString(),
    };

    // ignore: avoid_print
    print('Request Payload: $requestPayload');

    final response = await http.post(
      Uri.parse(Endpoints2.tambahRating),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: requestPayload,
    );

    // ignore: avoid_print
    print('Request Body: $requestPayload');
    // ignore: avoid_print
    print('Response status: ${response.statusCode}');
    // ignore: avoid_print
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Dokter>> fetchDokterByYear(String tahunKerja,
      {String orderBy = 'ASC'}) async {
    final response = await http.get(Uri.parse(
        '${Endpoints2.dokterBy}?order_by=$orderBy&tahun_kerja=$tahunKerja'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Dokter.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  static Future<Profile?> fetchUserData(int idpengguna) async {
    try {
      final response = await http.get(
        Uri.parse('${Endpoints2.readUserById}?Id_pengguna=$idpengguna'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Profile.fromJson(data['datas'][0]);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      throw Exception('Failed to load user data: $e');
    }
  }

  static Future<void> updateUserData(
      int idpengguna, String namapengguna, String email, String noHp) async {
    try {
      final response = await http.put(
        Uri.parse('${Endpoints2.updateUser}/$idpengguna'),
        body: {
          'nama_pengguna': namapengguna,
          'email': email,
          'No_Telpn': noHp,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update user data');
      }
    } catch (e) {
      throw Exception('Failed to update user data: $e');
    }
  }

  static Future<void> uploadImage(int idpengguna, File imageFile) async {
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(Endpoints2.uploadUserPhoto),
      );
      request.fields['Id_pengguna'] = idpengguna.toString();
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      final response = await request.send();

      if (response.statusCode != 200) {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
