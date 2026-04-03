

class Section {
  final String sectionId;
  final String courseId;
  final String title;
  final int order;

  Section({
    required this.sectionId,
    required this.courseId,
    required this.title,
    required this.order,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      sectionId: json['sectionId'],
      courseId: json['courseId'],
      title: json['title'],
      order: json['order'],
    );
  }
}
