import 'package:firstapp/core/bloc/database_states/database_abstract.dart';
import 'package:firstapp/data/models/mainDataModel/MainDataClass.dart';

class DatabaseLoaded extends DatabaseState {
  final CompleteDatabase database;

  // Extra metadata
  final DateTime fetchedAt; // when data was loaded
  final bool fromCache; // was it cached or freshly fetched?
  final String? source; // e.g. "local", "remote API"
  final String? userMessage; // optional friendly message for UI

  DatabaseLoaded(
    this.database, {
    DateTime? fetchedAt,
    this.fromCache = false,
    this.source,
    int? recordCount,
    this.userMessage,
  }) : fetchedAt = fetchedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
    database,
    fetchedAt,
    fromCache,
    source,
    userMessage,
  ];
}
