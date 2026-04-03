import '/exports/data_paths.dart';




class CompleteDatabase {
  final List<User> users;
  final List<Category> categories;
  final List<Certificate> certificates;
  final List<Course> courses;
  final List<Forum> forums;
  final List<Instructor> instructors;
  final List<Enrollment> enrollments;
  final List<Payment> payments;
  final List<Post> posts;
  final List<Question> questions;
  final List<Quiz> quizzes;
  final List<Review> reviews;
  final List<Section> sections;
  final List<Student> students;
  final List<Lesson> lessons;
  final List<Notification> notifications;

  CompleteDatabase({
    required this.users,
    required this.certificates,
    required this.categories,
    required this.courses,
    required this.forums,
    required this.instructors,
    required this.enrollments,
    required this.payments,
    required this.posts,
    required this.questions,
    required this.quizzes,
    required this.reviews,
    required this.sections,
    required this.students,
    required this.lessons,
    required this.notifications,
  });

  static CompleteDatabase emptydata = CompleteDatabase(
    users: [],
    categories: [],
    certificates: [],
    courses: [],
    forums: [],
    instructors: [],
    enrollments: [],
    payments: [],
    posts: [],
    questions: [],
    quizzes: [],
    reviews: [],
    sections: [],
    students: [],
    lessons: [],
    notifications: [],
  );

  factory CompleteDatabase.fromJson(Map<String, dynamic> json) {
    // Helper function to safely parse lists
    List<T> parseList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
      if (json[key] == null || json[key] is! List) {
        return [];
      }
      return List<T>.from(
        (json[key] as List).map((x) => fromJson(x)),
      );
    }

    return CompleteDatabase(
      users: parseList('User', User.fromJson),
      categories: parseList('Category', Category.fromJson),
      certificates: parseList('Certificates', Certificate.fromJson),
      courses: parseList('Courses', (Map<String, dynamic> json) {
        // Clean up course data
        final cleanedJson = Map<String, dynamic>.from(json);

        // Handle description cleaning
        if (cleanedJson['description'] is String) {
          cleanedJson['description'] = (cleanedJson['description'] as String)
              .replaceAll('\n', ' ')
              .trim();
        }

        // Handle instructor name cleaning
        if (cleanedJson['instructorName'] is String) {
          cleanedJson['instructorName'] = (cleanedJson['instructorName'] as String)
              .replaceAll('\n', ' ')
              .trim();
        }

        // Clean URLs
        if (cleanedJson['url'] is String) {
          cleanedJson['url'] = (cleanedJson['url'] as String).trim();
        }
        if (cleanedJson['thumbnail'] is String) {
          cleanedJson['thumbnail'] = (cleanedJson['thumbnail'] as String).trim();
        }

        // Convert rating to double if it's int
        if (cleanedJson['rating'] is int) {
          cleanedJson['rating'] = (cleanedJson['rating'] as int).toDouble();
        }

        // Convert price to double if it's int
        if (cleanedJson['price'] is int) {
          cleanedJson['price'] = (cleanedJson['price'] as int).toDouble();
        }

        // Convert enrolled to int if it's not
        if (cleanedJson['enrolled'] is double) {
          cleanedJson['enrolled'] = (cleanedJson['enrolled'] as double).toInt();
        }

        return Course.fromJson(cleanedJson);
      }),
      forums: parseList('Forum', Forum.fromJson),
      instructors: parseList('Instructors', Instructor.fromJson),
      enrollments: parseList('Enrollements', Enrollment.fromJson),
      payments: parseList('Payments', Payment.fromJson),
      posts: parseList('Posts', Post.fromJson),
      questions: parseList('Questions', Question.fromJson),
      quizzes: parseList('Quizzes', Quiz.fromJson),
      reviews: parseList('Review', Review.fromJson),
      sections: parseList('Sections', Section.fromJson),
      students: parseList('Student', Student.fromJson),
      lessons: parseList('Lesson', (Map<String, dynamic> json) {
        // Clean up lesson data
        final cleanedJson = Map<String, dynamic>.from(json);

        // Clean video URL
        if (cleanedJson['videoUrl'] is String) {
          cleanedJson['videoUrl'] = (cleanedJson['videoUrl'] as String).trim();
        }

        return Lesson.fromJson(cleanedJson);
      }),
      notifications: parseList('Notifications', Notification.fromJson),
    );
  }

  Map<String, int> getCounts() {
    return {
      'Users': users.length,
      'Categories': categories.length,
      'Courses': courses.length,
      'Forums': forums.length,
      'Certificates': certificates.length,
      'Instructors': instructors.length,
      'Enrollments': enrollments.length,
      'Payments': payments.length,
      'Posts': posts.length,
      'Questions': questions.length,
      'Quizzes': quizzes.length,
      'Reviews': reviews.length,
      'Sections': sections.length,
      'Students': students.length,
      'Lessons': lessons.length,
      'Notifications': notifications.length,
    };
  }

  // Helper methods for common queries
  User? getUserById(String userId) {
    return users.firstWhere((user) => user.userId == userId);
  }

  Course? getCourseById(String courseId) {
    return courses.firstWhere((course) => course.courseId == courseId);
  }

  List<Course> getFeaturedCourses() {
    return courses.where((course) => course.status.featured == true).toList();
  }

  List<Course> getPublishedCourses() {
    return courses.where((course) => course.status.published == true).toList();
  }

  List<Course> getCoursesByCategory(String categoryId) {
    return courses.where((course) => course.categoryId == categoryId).toList();
  }

  List<Enrollment> getEnrollmentsByStudent(String studentId) {
    return enrollments.where((enrollment) => enrollment.studentId == studentId).toList();
  }

  List<Review> getReviewsByCourse(String courseId) {
    return reviews.where((review) => review.courseId == courseId).toList();
  }

  double getAverageCourseRating(String courseId) {
    final courseReviews = getReviewsByCourse(courseId);
    if (courseReviews.isEmpty) return 0.0;

    final totalRating = courseReviews.fold(0, (sum, review) => sum + review.rating);
    return totalRating / courseReviews.length;
  }

  List<Lesson> getLessonsBySection(String sectionId) {
    return lessons.where((lesson) => lesson.sectionId == sectionId).toList();
  }

  List<Post> getPostsByForum(String forumId) {
    return posts.where((post) => post.forumId == forumId).toList();
  }

  // Get all courses with their instructors
  Map<Course, Instructor?> getCoursesWithInstructors() {
    final Map<Course, Instructor?> result = {};

    for (final course in courses) {
      final instructor = instructors.firstWhere(
            (instructor) => instructor.instructorId == course.instructorId,
        orElse: () => Instructor(
          instructorId: '',
          userId: '',
          bio: '',
          qualifications: '',
          rating: 0.0,
        ),
      );
      result[course] = instructor.userId.isNotEmpty ? instructor : null;
    }

    return result;
  }
}
















