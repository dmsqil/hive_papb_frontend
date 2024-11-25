import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'settings_screen.dart'; // Make sure this file exists

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs: Utas, Balasan, Postingan Ulang
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: const Icon(Icons.public, color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Navigate to Settings Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Christopher Lee',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text(
                                'chlee49',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF131313),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  'hive.net',
                                  style: TextStyle(
                                    color: Color(0xFFA0A0A0),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tertarik untuk belajar\nhal unik dan menarik!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/937261aeaab2482b817691a974988cbc/d82e367c5e93cd0a0a3b089954f3cae203ab745585c54586d4386a46f12160fa?apiKey=937261aeaab2482b817691a974988cbc&',
                                width: 28,
                                height: 19,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '1jt Pengikut',
                                style: TextStyle(
                                  color: Color(0xFFB8B8B8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 36,
                      backgroundImage: NetworkImage(
                        'https://cdn.builder.io/api/v1/image/assets/937261aeaab2482b817691a974988cbc/1e161662a63bc0c669756b18484c73b0ee2a98b8538de4c7bab574510f7584ae?apiKey=937261aeaab2482b817691a974988cbc&',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Actions: Edit Profile and Share Profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF2F2F2F)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: const Text(
                          'Edit profil',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF2F2F2F)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: const Text(
                          'Bagikan Profil',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Tab Navigation
              Container(
                color: Colors.black,
                child: const TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Utas'),
                    Tab(text: 'Balasan'),
                    Tab(
                      child: Text(
                        'Postingan\nUlang',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
                    _buildPostList(4), // Threads with 4 posts
                    _buildPostList(4), // Replies with 4 posts
                    _buildEmptyMessage(), // Empty reposts
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: 4, // Set active tab
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          ],
        ),
      ),
    );
  }

  static Widget _buildPostList(int count) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _buildPostCard(
              username: 'User $index',
              timeAgo: '${index + 1}h',
              content: 'Contoh konten untuk utas atau balasan $index',
              profileImage:
                  'https://cdn.builder.io/api/v1/image/assets/937261aeaab2482b817691a974988cbc/f27c645d5ff706bea5b251dfa82d76e654df24c6f658ee62cd3c5f95dbf1e66c?apiKey=937261aeaab2482b817691a974988cbc&',
            ),
            _buildInteractionBar(),
          ],
        );
      },
    );
  }

  static Widget _buildEmptyMessage() {
    return Center(
      child: Text(
        'Belum ada postingan ulang',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }

  static Widget _buildPostCard({
    required String username,
    required String timeAgo,
    required String content,
    required String profileImage,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(profileImage),
            radius: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildInteractionBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconWithText(Icons.favorite_border, '100'),
          _buildIconWithText(Icons.comment, '50'),
          _buildIconWithText(Icons.share, ''),
        ],
      ),
    );
  }

  static Widget _buildIconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
