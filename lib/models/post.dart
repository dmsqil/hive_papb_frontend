import 'package:intl/intl.dart';
String baseUrl = 'https://example.com/'; // Ganti dengan domain API Anda

class Post {
  final int id;
  final int userId;
  final String body;
  final String? image;
  final int likeCount;
  final int commentCount;
  final String createdAt;
  final String updatedAt;
  final String userName;
  final String? userProfileImage;
  final bool isLiked;

  Post({
    required this.id,
    required this.userId,
    required this.body,
    required this.image,
    required this.likeCount,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.userProfileImage,
    required this.isLiked,
  });

  factory Post.fromJson(Map<String, dynamic> json, int authUserId) {
    String? resolveImage(String? image) {
      if (image == null) return null;

      // Periksa apakah URL sudah absolut
      if (image.startsWith('http://') || image.startsWith('https://')) {
        return image;
      }

      // Jika relatif, tambahkan base URL
      const String baseUrl = 'https://example.com/';
      return '$baseUrl$image';
    }

    return Post(
      id: json['id'],
      userId: json['user_id'],
      body: json['body'],
      image: resolveImage(json['image']),
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      // createdAt: DateTime.parse(json['created_at'] as String),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userName: json['user']['name'],
      userProfileImage: json['user']['image'],
      isLiked: (json['user']['id'] == authUserId),
    );
  }

  // Method to get formatted date
   String get formattedDate {
    DateTime parseDate = DateTime.parse(createdAt);
    return DateFormat('MMM dd, yyyy').format(parseDate); // Formats DateTime to "Nov 21, 2023"
  }
}
