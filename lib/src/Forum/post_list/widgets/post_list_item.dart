import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    required this.title,
    required this.post,
    super.key,
    this.onPressed,
  });

  final String title;
  final String post;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        post,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onPressed,
    );
  }
}
