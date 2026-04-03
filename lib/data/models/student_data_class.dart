

class Student {
  final String studentId;
  final List<String> enrolledCourses;
  final List<Map<String, double>> progress;
  final int userId;

  Student({
    required this.studentId,
    required this.enrolledCourses,
    required this.progress,
    required this.userId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentId: json['studentId'] as String,
      enrolledCourses: List<String>.from(json['enrolledCourses']),
      progress: (json['progress'] as List)
          .map((e) => Map<String, double>.from(
          e.map((key, value) => MapEntry(key as String, (value as num).toDouble()),
          ))
      )
          .toList(),
      userId: json['userId'] as int,
    );
  }

}


