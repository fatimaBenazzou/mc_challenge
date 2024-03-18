import 'package:flutter/material.dart';
import 'package:untitled/models/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.content ?? ''),
      subtitle: Text('Posted by: ${post.user}'),
      leading: post.image != null ? Image.asset(post.image!) : null,
    );
  }
}