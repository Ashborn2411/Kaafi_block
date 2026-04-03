import '../LocalStorage/smallStorage.dart';
import '../User_Session/User_Session.dart';
import '../../models/mainDataModel/MainDataClass.dart';
import '../../models/courses_data_class.dart';
import '../../models/user_data_class.dart';

class EssentialData {
  final SmallStorage smallStorage;
  final CompleteDatabase database;
  final String courseId;

  EssentialData({
    required this.courseId,
    required this.smallStorage,
    required this.database,
  });

  String get userId => UserSession().userID;
  String get email => UserSession().userEmail;
  String get userName => UserSession().userName;

  Course getCourseById(String id) =>
      database.courses.firstWhere((v) => v.courseId == id);

  List<Course> get courselist => database.courses;

  Course get course => database.courses.firstWhere(
    (v) => v.courseId == courseId,
    orElse: () => Course.empty,
  );

  List<String> get cartList => database.users
      .firstWhere(
        (v) => v.userId == smallStorage.box.read("id"),
        orElse: () => User.empty,
      )
      .cartlist;

  List<String> get enrolledList => database.users
      .firstWhere(
        (v) => v.userId == smallStorage.box.read("id"),
        orElse: () => User.empty,
      )
      .enrolledlist;

  List<String> get wishlist => database.users
      .firstWhere(
        (v) => v.userId == smallStorage.box.read("id"),
        orElse: () => User.empty,
      )
      .wishlist;
}
