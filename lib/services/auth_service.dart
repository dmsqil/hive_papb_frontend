import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://172.16.1.73:8000/api';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        try {
          return json.decode(response.body);
        } catch (e) {
          throw Exception("Gagal memproses respons JSON: ${response.body}");
        }
      } else if (response.statusCode == 400) {
        throw Exception("Login gagal, periksa username atau password Anda.");
      } else if (response.headers['content-type']?.contains('text/html') ?? false) {
        throw Exception("Terjadi kesalahan: Server mengembalikan halaman HTML, bukan JSON.");
      } else {
        throw Exception("Terjadi kesalahan pada server (${response.statusCode}).");
      }
    } catch (e) {
      throw Exception("Gagal menghubungkan ke server: $e");
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      if (response.statusCode == 201) {
        try {
          return json.decode(response.body);
        } catch (e) {
          throw Exception("Gagal memproses respons JSON: ${response.body}");
        }
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw Exception("Permintaan salah (${response.statusCode}): ${response.body}");
      } else if (response.statusCode >= 500) {
        throw Exception("Kesalahan server (${response.statusCode}): ${response.body}");
      } else if (response.headers['content-type']?.contains('text/html') ?? false) {
        throw Exception("Terjadi kesalahan: Server mengembalikan halaman HTML, bukan JSON.");
      } else {
        throw Exception("Respons tidak terduga (${response.statusCode}).");
      }
    } catch (e) {
      throw Exception("Gagal menghubungkan ke server: $e");
    }
  }
}
