

class Instructor {
  final String instructorId;
  final String userId;
  final String bio;
  final String qualifications;
  final double rating;

  Instructor({
    required this.instructorId,
    required this.userId,
    required this.bio,
    required this.qualifications,
    required this.rating,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      instructorId: json['instructorId'],
      userId: json['userId'],
      bio: json['bio'],
      qualifications: json['qualifications'],
      rating: json['rating'] is int ? (json['rating'] as int).toDouble() : json['rating'],
    );
  }
}