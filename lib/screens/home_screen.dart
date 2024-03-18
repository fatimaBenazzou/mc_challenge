import 'package:flutter/material.dart';
import 'package:untitled/data/dummy_posts.dart';
import 'package:untitled/main.dart';
import 'package:untitled/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
        child: ListView(
          children: [
            // Serch bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: kColorScheme.primary, width: 2.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: kColorScheme.primary),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: kColorScheme.primary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Text(
                  'The latest',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: kColorScheme.primary),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Divider(color: kColorScheme.primary),
                ),
              ],
            ),

            const SizedBox(height: 16),
            
            // Posts
            for (final post in dummyPosts) PostWidget(post: post)
            // ...dummyPosts.map((post) => PostWidget(post: post)).toList(),
          ],
        ),
      ),
    );
  }
}
