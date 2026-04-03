

class Quiz {
  final String quizId;
  final String courseId;
  final String title;
  final int passingGrade;

  Quiz({
    required this.quizId,
    required this.courseId,
    required this.title,
    required this.passingGrade,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      quizId: json['quizId'],
      courseId: json['courseId'],
      title: json['title'],
      passingGrade: json['passingGrade'],
    );
  }
}