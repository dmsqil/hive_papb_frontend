import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);

  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Utas baru",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar profil
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/profile/chris.png'), // Sesuaikan path gambar profil
                  radius: 20,
                ),
                const SizedBox(width: 10),
                // Kolom input teks
                Expanded(
                  child: TextField(
                    controller: postController,
                    maxLines: null, // Membiarkan teks meluas ke beberapa baris
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: "Apa yang baru?",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5), // Garis pemisah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.link, color: Colors.grey), // Ikon lampiran
                const SizedBox(width: 10),
                const Text(
                  "Tambahkan ke utas",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Bagian bawah (tombol kirim dan teks balasan)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Semua orang dapat membalas",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Logika untuk mengirim postingan
                    final postContent = postController.text.trim();
                    if (postContent.isNotEmpty) {
                      // Tambahkan logika untuk menyimpan atau mengirim post
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    }
                  },
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
