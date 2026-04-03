import 'package:equatable/equatable.dart';
import '/exports/data_paths.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  final CompleteDatabase database;
  
  const DatabaseLoaded(this.database);

  @override
  List<Object?> get props => [database];
}

class DatabaseError extends DatabaseState {
  final String message;
  const DatabaseError(this.message);

  @override
  List<Object?> get props => [message];
}
