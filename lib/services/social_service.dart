class HighlightPost {
  final String postId;
  final String username;
  final String userAvatar;
  final String title;
  int likes;
  bool isLiked;

  HighlightPost({
    required this.postId,
    required this.username,
    required this.userAvatar,
    required this.title,
    this.likes = 0,
    this.isLiked = false,
  });
}

class SocialService {
  List<HighlightPost> getFeedPosts() {
    return [
      HighlightPost(
        postId: 'p1',
        username: 'شاه_حکم',
        userAvatar: '👑',
        title: 'کوت کردن تیم حریف در دست آخر فینال تورنمنت! 🔥',
        likes: 128,
      ),
      HighlightPost(
        postId: 'p2',
        username: 'استاد_آس',
        userAvatar: '♠️',
        title: 'رد کردن تک خشت روی حکم حریف و رد شدن دست 🤩',
        likes: 95,
      ),
    ];
  }
}
