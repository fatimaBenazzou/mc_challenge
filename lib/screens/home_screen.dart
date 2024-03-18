import 'package:flutter/material.dart';
import 'package:untitled/data/dummy_posts.dart';
import 'package:untitled/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
          itemCount: dummyPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostWidget(post: dummyPosts[index]);
          },
        ),
    );
  }
}