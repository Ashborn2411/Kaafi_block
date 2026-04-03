import '/exports/data_paths.dart';



class ComputerAdapter {
  Map<String, dynamic> _safeMap(dynamic item) =>
      Map<String, dynamic>.from(item as Map);

  List<dynamic> isolateMapFactory(Map<String, dynamic> payload) {
    final String tableName = payload['tableName'];
    final List<dynamic> rawList = payload['data'];

    return rawList
        .map((e) => DataClassFactory.create(tableName, _safeMap(e)))
        .toList();
  }
}
