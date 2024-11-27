import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PostService {

  final String apiUrl = "http://172.16.2.12:8000/api";

  // ambil semua data post, tampilkan di home
  Future<List<Post>> fetchPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    // final authUserJson = prefs.getString('authUser');

    // // Check for nullability 
    // if (token == null || authUserJson == null) { throw Exception('User not authenticated'); }

    // // Decode the user JSON safely
    // final authUser = json.decode(authUserJson) as Map<String, dynamic>;
    // print(authUser); // This will print the JSON object
    // final id = int.tryParse(authUser['id'].toString()) ?? 0;

    // if (id == null) {
    //   throw Exception('Failed to parse user ID');
    // }

    final response = await http.get(
      Uri.parse('$apiUrl/posts/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Optional, specify if needed
      },
    );

    if (response.statusCode == 200) {
      // Decode JSON respons sebagai Map
      final Map<String, dynamic> jsonData = json.decode(response.body);

      // Ambil daftar `posts` dari JSON
      final List<dynamic> postsJson = jsonData['posts'];
  
      // Cetak log untuk debugging
      print("Berhasil fetching");

      // Log for debugging 
      print("Fetching successful");

      // Map daftar `posts` menjadi List<Post>
      return postsJson.map((post) => Post.fromJson(post, 1)).toList();
    
    } else if (response.statusCode == 401) {
        throw Exception("Unauthenticated: ${response.statusCode}");
    } else {
      throw Exception("Failed to fetch posts: ${response.statusCode}");
    }
  }

  // buat eksekusi post dari like
  static Future<void> likePost(int postId) async {
      final prefs = await SharedPreferences.getInstance(); 
      final token = prefs.getString('authToken');
      
      final response = await http.get(

        Uri.parse('http://172.16.2.12:8000/api/posts/$postId/like'),

        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', // Optional, specify if needed
        },
      );

      if (response.statusCode == 200) {
        print('Post liked successfully');
      } else {
        print('Failed to like post: ${response.statusCode}');
      }
    try {
    } catch (error) {
      print('Error liking post: $error');
    }
  }
}
