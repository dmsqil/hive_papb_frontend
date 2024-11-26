import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Hive', style: TextStyle(color: Colors.white)),
        centerTitle: false, // Teks "Hive" di sebelah kiri
        titleSpacing: 0, // Mengatur jarak teks dengan panah
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Comment Item Christopher Lee
                CommentItem(
                  name: 'Christopher Lee',
                  message: 'Hei @zuck dimana centang biru saya?',
                  timeAgo: '50m',
                  likes: 30,
                  replies: 4,
                  isVerified: false,
                  profileImage: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/chris.png"),
                    radius: 25,
                  ),
                ),
                // Garis abu-abu di bawah Christopher Lee
                Divider(
                  color: Colors.grey[800], // Warna abu-abu
                  thickness: 0.5, // Ketebalan garis
                  indent: 16, // Jarak dari kiri
                  endIndent: 16, // Jarak dari kanan
                ),
                // Komentar lainnya
                CommentItem(
                  name: 'zuck',
                  message: 'Tunggu sebentar..😂',
                  likes: 4,
                  timeAgo: '49m',
                  isVerified: true,
                  profileImage: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/zuck.png"),
                    radius: 25,
                  ),
                ),
                CommentItem(
                  name: 'nero',
                  message: 'Halooo😂',
                  likes: 3,
                  timeAgo: '48m',
                  isVerified: true,
                  profileImage: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/nero.png"),
                    radius: 25,
                  ),
                ),
                CommentItem(
                  name: 'fujii_an',
                  message: 'Selamat datang Chris :)',
                  likes: 2,
                  timeAgo: '40m',
                  isVerified: true,
                  profileImage: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/fuji.png"),
                    radius: 25,
                  ),
                ),
                CommentItem(
                  name: 'Figma',
                  message: 'Selamat datang temanku😂',
                  likes: 2,
                  timeAgo: '30m',
                  isVerified: true,
                  profileImage: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile/figma.png"),
                    radius: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(
                top: BorderSide(color: Colors.grey[800]!),
              ),
            ),
            child: Row(
              children: [
                // Profile picture of Christopher Lee
                CircleAvatar(
                  backgroundImage: AssetImage("assets/profile/chris.png"),
                  radius: 20, // Adjust the size of the avatar
                ),
                SizedBox(
                    width: 12), // Space between the avatar and the text field
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Tambahkan Pesan',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Tambahkan logika untuk mengirim komentar
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String name;
  final String message;
  final String timeAgo;
  final int? likes;
  final int? replies;
  final bool isVerified;
  final Widget? profileImage;

  CommentItem({
    required this.name,
    required this.message,
    required this.timeAgo,
    this.likes,
    this.replies,
    this.isVerified = false,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileImage ?? 
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
                child: Icon(Icons.person, color: Colors.white),
              ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isVerified)
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child:
                            Icon(Icons.verified, color: Colors.blue, size: 16),
                      ),
                    Spacer(),
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    PopupMenuButton<String>(
                      icon:
                          Icon(Icons.more_vert, color: Colors.white, size: 18),
                      onSelected: (value) {
                        // Handle menu actions
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Report',
                          child: Text('Laporkan'),
                        ),
                        PopupMenuItem(
                          value: 'Delete',
                          child: Text('Hapus'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(message, style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Row(
                  children: [
                    if (likes != null)
                      Row(
                        children: [
                          Icon(Icons.favorite_border,
                              color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text('$likes',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(Icons.comment, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('${replies ?? 0}',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(Icons.share, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text('Bagikan',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
