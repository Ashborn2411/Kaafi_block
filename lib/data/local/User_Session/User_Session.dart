import '../LocalStorage/smallStorage.dart';

class UserSession {
  final SmallStorage sm = SmallStorage.instance;
  
  String get userID => sm.box.read("id") ?? "Name";
  String get userEmail => sm.box.read("email") ?? "Email";
  String get userName => sm.box.read("name") ?? "Hello";
  bool get login => sm.box.read("login") ?? false;
}