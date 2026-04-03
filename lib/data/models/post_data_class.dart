

class Post {
  final String postId;
  final String forumId;
  final String authorId;
  final String content;
  final DateTime date;
  final String courseId;

  Post({
    required this.postId,
    required this.forumId,
    required this.authorId,
    required this.content,
    required this.date,
    required this.courseId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      forumId: json['forumId'],
      authorId: json['authorId'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      courseId: json['courseId'],
    );
  }
}
