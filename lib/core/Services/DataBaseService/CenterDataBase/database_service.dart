import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/exports/data_paths.dart';

abstract class MainDatabase {
  Future<CompleteDatabase> fetchData();
  Future<void> refresh();
  Future<void> initialize();
  void clear();
  CompleteDatabase get getData;
}

class DatabaseService implements MainDatabase {
  static final DatabaseService instance = DatabaseService._internal();
  CompleteDatabase _database = CompleteDatabase.emptydata;
  bool _isInit = false;

  DatabaseService._internal();

  static CompleteDatabase parseCompleteDatabase(dynamic json) {
    return CompleteDatabase.fromJson(json);
  }

  @override
  Future<CompleteDatabase> fetchData() async {
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase.rpc('get_all_data');
      _database = await compute(parseCompleteDatabase, response);
      return _database;
    } catch (e) {
      debugPrint('Error fetching database: $e');
      return _database;
    }
  }

  @override
  Future<void> initialize() async {
    if (!_isInit) {
      try {
        await fetchData();
        _isInit = true;
      } catch (e) {
        debugPrint('Initialization error: $e');
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<void> refresh() async {
    await fetchData();
  }

  @override
  void clear() {
    _database = CompleteDatabase.emptydata;
    _isInit = false;
  }

  @override
  CompleteDatabase get getData => _database;
}





