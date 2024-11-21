import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../blocs/widgets/post_item.dart';
import '../models/post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Post> posts = [
      Post(
        username: "Ruchi_hotah",
        content:
            "Kegagalan adalah batu lompatan menuju keberhasilan. Belajarlah dari masa lalu dan mencoba untuk melangkah ke depan.",
        likes: 4,
        comments: 1,
        share: 1,
        timeAgo: "49m",
        profileImage: "assets/profile/ruchi.png",
      ),
      Post(
        username: "Payal_shah",
        content: "Anda benar sekali!",
        likes: 4,
        comments: 1,
        share: 1,
        timeAgo: "44m",
        profileImage: "assets/profile/payal.png",
      ),
      Post(
        username: "Christopher Lee",
        content: "Hey @zuck dimana centang biru saya?",
        likes: 4,
        comments: 1,
        share: 1,
        timeAgo: "50m",
        profileImage: "assets/profile/chris.png",
      ),
      Post(
        username: "zuck",
        content: "Tunggu sebentar 😂",
        likes: 8,
        comments: 1,
        share: 1,
        timeAgo: "50m",
        profileImage: "assets/profile/zuck.png",
      ),
      Post(
        username: "figma",
        content: "Halo teman (lama) baru ✌",
        likes: 4,
        comments: 1,
        share: 1,
        timeAgo: "6m",
        profileImage: "assets/profile/figma.png",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: SvgPicture.asset(
          'assets/logo.svg', // Path file SVG
          width: 40, // Lebar SVG
          height: 40, // Tinggi SVG
          color: Colors.white, // Pewarnaan jika diperlukan
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(post: posts[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            // Navigasi ke halaman tambah post
            Navigator.pushNamed(context, '/add_post');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), // Ikon tambah post
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
