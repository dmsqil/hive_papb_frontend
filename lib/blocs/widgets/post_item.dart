import 'package:flutter/material.dart';
import '../../models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(post.profileImage),
              ),
              const SizedBox(width: 10),
              Text(
                post.username,
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
          Text(
            post.content,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.red),
                  const SizedBox(width: 5),
                  Text(
                    post.likes.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(Icons.comment_outlined, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    post.comments.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(Icons.share, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    post.share.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                post.timeAgo,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const Divider(color: Color.fromARGB(255, 69, 69, 69)),
        ],
      ),
    );
  }
}
