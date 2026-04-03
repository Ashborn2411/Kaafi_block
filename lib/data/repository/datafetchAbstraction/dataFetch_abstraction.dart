import '/exports/data_paths.dart';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchData {
  final SupabaseClient client;
  final ComputerAdapter adapter;

  FetchData({required this.client, required this.adapter});

  Future<List<dynamic>?> fetchData(
    String tableName,
    MainDatabase database,
  ) async {
    try {
      final response = await client.from(tableName).select('*');
      final value = compute(adapter.isolateMapFactory, {
        'tableName': tableName,
        'data': response,
      });
      return value;
    } catch (e) {
      print('Error fetching table: $e');
      return null;
    }
  }

  bool checkMainDatabse(dynamic controller) {
    return controller.database.value == CompleteDatabase.emptydata;
  }

  void refresh(String tableName, MainDatabase database) {
    fetchData(tableName, database);
  }
}
