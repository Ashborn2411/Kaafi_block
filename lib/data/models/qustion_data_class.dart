


class Question {
  final String questionId;
  final String quizId;
  final String text;
  final List<String> options;
  final dynamic correctAnswer; // Could be String or List<String>

  Question({
    required this.questionId,
    required this.quizId,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    // Handle the correctAnswer field which might be a string or list
    dynamic correctAnswer;
    if (json['correctAnswer'] is List) {
      correctAnswer = List<String>.from(json['correctAnswer']);
    } else {
      correctAnswer = json['correctAnswer'] as String;
    }

    return Question(
      questionId: json['questionId'],
      quizId: json['quizId'],
      text: json['text'],
      options: List<String>.from(json['options']),
      correctAnswer: correctAnswer,
    );
  }
}