import 'database_abstract.dart';

class DatabaseInitial extends DatabaseState {
  final String message;
  final bool isInitialize;
  final bool isConfigured;
  final DateTime enteredAt;

  DatabaseInitial({
    required this.message,
    this.isInitialize = false,
    this.isConfigured = false,
    DateTime? enteredAt,
  }) : enteredAt = enteredAt ?? DateTime.now();
  @override
  List<Object?> get props => [message, isInitialize, isConfigured, enteredAt];
}
