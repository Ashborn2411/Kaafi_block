import 'package:shared_preferences/shared_preferences.dart';

class SmallStorage {
  static final SmallStorage instance = SmallStorage._internal();
  SmallStorage._internal();
  factory SmallStorage() => instance;

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> write(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    }
  }

  dynamic getData(String key) {
    return _prefs.get(key);
  }

  dynamic read(String key) {
    return _prefs.get(key);
  }

  SmallStorage get box => this;

  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  void writeIfNull(String key, dynamic value) async {
    if (_prefs.get(key) == null) {
      await write(key, value);
    }
  }
}
