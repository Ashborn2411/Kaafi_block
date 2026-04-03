import '/exports/data_paths.dart';




class DataClassName {
  static Type getDataType(String type) {
    switch (type.toLowerCase()) {
      case AppString.course:
        return Course;
      case AppString.certificate:
        return Certificate;
      case AppString.user:
        return User;
      case AppString.student:
        return Student;
      case AppString.instructor:
        return Instructor;
      case AppString.enrollment:
        return Enrollment;
      case AppString.section:
        return Section;
      case AppString.lesson:
        return Lesson;
      case AppString.quiz:
        return Quiz;
      case AppString.question:
        return Question;
      case AppString.review:
        return Review;
      case AppString.forum:
        return Forum;
      case AppString.post:
        return Post;
      case AppString.payment:
        return Payment;
      case AppString.notification:
        return Notification;
      default:
        throw Exception('Unknown type: $type');
    }
  }
}