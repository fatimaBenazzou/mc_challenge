import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/dummy_users.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/post.dart';
import 'package:untitled/models/user.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  bool isCommented = false;
  bool isSaved = false;

  User getUserInfo(Post post) {
    return dummyUsers.where((user) => user.userName == post.user).first;
  }

  bool toggleButton(bool button) {
    setState(() {
      button = !button;
    });

    return button;
  }

  @override
  Widget build(BuildContext context) {
    User userInfos = getUserInfo(widget.post);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: kColorScheme.primary, width: 2),
      ),
      color: kColorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // user infos
            ListTile(
              title: Text(
                userInfos.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('@ ${userInfos.userName}',
                  style: Theme.of(context).textTheme.labelSmall),
              leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(userInfos.image)),
            ),

            // post content
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget.post.content != null
                  ? Text(widget.post.content!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black))
                  : const Text(''),
            ),
            widget.post.image != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Image.asset(widget.post.image!)),
                  )
                : const Text(''),

            // action buttons

            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Like
                      IconButton(
                        onPressed: () {
                          isLiked = toggleButton(isLiked);
                          print(isLiked);
                        },
                        icon: Icon(
                            isLiked
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: kColorScheme.primary),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // Comment
                      IconButton(
                        onPressed: () {
                          isCommented = toggleButton(isCommented);
                        },
                        icon: Icon(
                            isCommented
                                ? CupertinoIcons.bubble_left_fill
                                : CupertinoIcons.bubble_left,
                            color: kColorScheme.primary),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // Share
                      IconButton(
                        onPressed: () {
                          // Action de partage
                        },
                        icon: Icon(CupertinoIcons.arrow_2_squarepath,
                            color: kColorScheme.primary),
                      ),
                    ],
                  ),
                ),

                // Save
                IconButton(
                  onPressed: () {
                    isSaved = toggleButton(isSaved);
                  },
                  icon: Icon(
                      isSaved
                          ? CupertinoIcons.bookmark_fill
                          : CupertinoIcons.bookmark,
                      color: kColorScheme.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
