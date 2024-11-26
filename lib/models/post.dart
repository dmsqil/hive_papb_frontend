class Post {
  final String name;
  final String content;
  final int likes;
  final int comments;
  final int share;
  final String timeAgo;
  final String profileImage; // Tambahkan properti untuk gambar profil

  Post({
    required this.name,
    required this.content,
    required this.likes,
    required this.comments,
    required this.share, 
    required this.timeAgo,
    required this.profileImage,
  });
}
