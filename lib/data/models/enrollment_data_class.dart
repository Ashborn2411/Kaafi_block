

class Enrollment {
  final String enrollmentId;
  final String studentId;
  final String courseId;
  final DateTime enrollmentDate;
  final double progress;
  final String status;

  Enrollment({
    required this.enrollmentId,
    required this.studentId,
    required this.courseId,
    required this.enrollmentDate,
    required this.progress,
    required this.status,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      enrollmentId: json['enrollmentId'],
      studentId: json['studentId'],
      courseId: json['courseId'],
      enrollmentDate: DateTime.parse(json['enrollmentDate']),
      progress: json['progress'] is int ? (json['progress'] as int).toDouble() : json['progress'],
      status: json['status'],
    );
  }
}
