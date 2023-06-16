class Post {
  const Post({
    required this.id,
    required this.title,
    required this.post,
  });

  factory Post.fromSnapshot(String? id, Object? snapshot) {
    final post = snapshot as Map<Object?, Object?>;
    return Post(
      id: id ?? '',
      title: post['title'] as String,
      post: post['post'] as String,
    );
  }

  final String id;
  final String title;
  final String post;
}
