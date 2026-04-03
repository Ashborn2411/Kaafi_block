import '/exports/data_paths.dart';




class DataClassFactory {
  static dynamic create(String type, Map<String, dynamic> json) {
    switch (type.toLowerCase()) {
      case 'courses':
        return Course.fromJson(json);
      case 'certificates':
        return Certificate.fromJson(json);
      case 'user':
        return User.fromJson(json);

      case 'student':
        return Student.fromJson(json);

      case 'instructors':
        return Instructor.fromJson(json);

      case 'enrollements':
        return Enrollment.fromJson(json);

      case 'sections':
        return Section.fromJson(json);

      case 'lesson':
        return Lesson.fromJson(json);

      case 'quizzes':
        return Quiz.fromJson(json);

      case 'questions':
        return Question.fromJson(json);

      case 'review':
        return Review.fromJson(json);

      case 'forum':
        return Forum.fromJson(json);

      case 'posts':
        return Post.fromJson(json);

      case 'payments':
        return Payment.fromJson(json);

      case 'notifications':
        return Notification.fromJson(json);
      case 'category':
        return Category.fromJson(json);
      case 'certificatelist':
      case 'certificate_list':
      // For CertificateList, we need to handle differently
      // It expects a list, not a map
        if (json.containsKey('certificates')) {
          final certsJson = json['certificates'] as List<dynamic>;
          final certificates = certsJson
              .map((certJson) => Certificate.fromJson(certJson))
              .toList();
          return CertificateList(certificates);
        }
        return CertificateList([]);

      default:
        throw Exception('Unknown type: $type');
    }
  }
}

