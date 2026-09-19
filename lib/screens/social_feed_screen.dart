import 'package:flutter/material.dart';
import '../services/social_service.dart';

class SocialFeedScreen extends StatefulWidget {
  const SocialFeedScreen({Key? key}) : super(key: key);

  @override
  State<SocialFeedScreen> createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<SocialFeedScreen> {
  final SocialService _socialService = SocialService();
  late List<HighlightPost> posts;

  @override
  void initState() {
    super.initState();
    posts = _socialService.getFeedPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فید برترین لحظات و استریم'),
        backgroundColor: Colors.deepOrange.shade900,
      ),
      body: Container(
        color: Colors.deepOrange.shade950,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              color: Colors.black45,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      child: Text(post.userAvatar, style: const TextStyle(fontSize: 20)),
                    ),
                    title: Text(post.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                      onPressed: () {},
                      child: const Text('دنبال کردن', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.black26,
                    child: const Center(
                      child: Icon(Icons.play_circle_fill, size: 60, color: Colors.amber),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      post.title,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          post.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: post.isLiked ? Colors.red : Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            post.isLiked = !post.isLiked;
                            post.likes += post.isLiked ? 1 : -1;
                          });
                        },
                      ),
                      Text('${post.likes}', style: const TextStyle(color: Colors.white70)),
                      const SizedBox(width: 16),
                      const Icon(Icons.comment, color: Colors.white70),
                      const SizedBox(width: 16),
                      const Icon(Icons.share, color: Colors.white70),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
