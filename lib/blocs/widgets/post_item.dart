import 'package:flutter/material.dart';
import '../../models/post.dart';

import '../../services/post_service.dart'; // Import your post service

class LikeButton extends StatefulWidget {
  final Post post; // post model

  LikeButton({required this.post});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.isLiked;
    likeCount = widget.post.likeCount;
  }

  void _toggleLike() async {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });

    // Call likePost() method
    await PostService.likePost(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _toggleLike,
          child: Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          likeCount.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}


class PostItem extends StatelessWidget {
  final Post post;
  final VoidCallback? onCommentTap;

  const PostItem({Key? key, required this.post, this.onCommentTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Post
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: post.userProfileImage != null
                    ? NetworkImage(post.userProfileImage!)
                    : null,
                child: post.userProfileImage == null
                    ? const Icon(Icons.person, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 10),
              Text(
                post.userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          const SizedBox(height: 10),
          // Konten Post
          Text(
            post.body,
            style: const TextStyle(color: Colors.white),
          ),
          if (post.image != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network( 
                post.image!, 
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) { 
                  return Image.network('https://picsum.photos/200/300'); // Your alternative image URL 
                }, 
              ),
            ),
          const SizedBox(height: 10),
          // Footer Post (ikon interaksi)
          Row(
            children: [
              // Tombol Suka
              Row(
                children: [
                  LikeButton(post: post),
                ],
              ),
              const SizedBox(width: 20),
              // Tombol Komentar
              GestureDetector(
                onTap: onCommentTap,
                child: Row(
                  children: [
                    const Icon(Icons.comment_outlined, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      post.commentCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Tombol Bagikan
              Row(
                children: [
                  const Icon(Icons.share, color: Colors.white),
                  const SizedBox(width: 5),
                  const Text("Share", style: TextStyle(color: Colors.white)),
                ],
              ),
              const Spacer(),
              // Waktu Postingan
              Text(
                post.formattedDate, // Output: Nov 21, 2023
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Divider(color: Color.fromARGB(255, 69, 69, 69)),
        ],
      ),
    );
  }
}

