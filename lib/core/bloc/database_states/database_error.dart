import 'database_abstract.dart';

class DatabaseError extends DatabaseState {
  final String message;
  final bool canRetry; // should UI show a retry button?
  final String? errorCode; // optional error code for debugging
  final DateTime occurredAt; // when the error happened
  final String? friendlyHint; // user-friendly suggestion

  DatabaseError(
    this.message, {
    this.canRetry = true,
    this.errorCode,
    DateTime? occurredAt,
    this.friendlyHint,
  }) : occurredAt = occurredAt ?? DateTime.now();

  @override
  List<Object?> get props => [
    message,
    canRetry,
    errorCode,
    occurredAt,
    friendlyHint,
  ];
}
