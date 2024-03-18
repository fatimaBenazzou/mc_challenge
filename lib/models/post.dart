class Post {
  const Post ({
    required this.id,
    required this.user,
    this.content,
    this.image,
  });

  final String id;
  final String user;
  final String? content;
  final String? image;
  // final int likes;

}