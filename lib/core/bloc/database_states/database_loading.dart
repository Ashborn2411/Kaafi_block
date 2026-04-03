import 'package:firstapp/core/bloc/database_states/database_abstract.dart';

class DatabaseLoading extends DatabaseState {
  final String message;
  final double progress; // 0.0 to 1.0
  final String? currentStep; // e.g. "Fetching courses", "Syncing enrollments"
  final DateTime startedAt; // when loading started
  final bool isIndeterminate; // true if progress is not measurable

  DatabaseLoading(
    this.message, {
    this.progress = 0.0,
    this.currentStep,
    DateTime? startedAt,
    this.isIndeterminate = false,
  }) : startedAt = startedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
    message,
    progress,
    currentStep,
    startedAt,
    isIndeterminate,
  ];
}
