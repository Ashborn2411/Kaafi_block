

class Lesson {
  final String lessonId;
  final String sectionId;
  final String title;
  final String content;
  final String videoUrl;
  final int duration;

  Lesson({
    required this.lessonId,
    required this.sectionId,
    required this.title,
    required this.content,
    required this.videoUrl,
    required this.duration,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonId: json['lessonId'],
      sectionId: json['sectionId'],
      title: json['title'],
      content: json['content'],
      videoUrl: json['videoUrl'].trim(),
      duration: json['duration'],
    );
  }
}
