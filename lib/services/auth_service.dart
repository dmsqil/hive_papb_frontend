import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hive_papb/utils/global_singleton.dart';

class AuthService {
  final String apiUrl = "http://172.16.1.95:8000/api";

  Future<Map<String, dynamic>> login(String email, String password) async {
    // final prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['token'] != null) {
        await saveToken(data['token']); // Save token after login
      }
      print(data['user']);
      await saveUser(data['user']);
      return data;
    } else if (response.statusCode == 403) {
      // Handle 403 Forbidden
      throw Exception("Pengguna tidak terdaftar");
    } else if (response.statusCode == 302) {
      // Handle 302 Validation Error
      throw Exception("Form tidak valid");
    } else {
      // Handle other HTTP errors
      throw Exception("Unexpected error: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword) async {
    final url = Uri.parse('$apiUrl/register');

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

  Future<bool> isAuthenticated() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken'); // Retrieve token from storage
      return token != null && token.isNotEmpty;
    } catch (e) {
      throw Exception("Failed to check authentication status: $e");
    }
  }
  
  Future<void> saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token); // Save token
    } catch (e) {
      throw Exception("Failed to save token: $e");
    }
  }

  // Example function to save the user after login 
  Future<void> saveUser(String user) async { 
    final prefs = await SharedPreferences.getInstance(); 
    await prefs.setString('authUser', user); } 
    // Example function to retrieve the user ID 
  
  // Future<String?> getUserId() async { 
  //   final prefs = await SharedPreferences.getInstance(); 
  //   return prefs.getString('authUserId'); 
  // }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('authToken'); // Remove token
    } catch (e) {
      throw Exception("Failed to log out: $e");
    }
  }
}
