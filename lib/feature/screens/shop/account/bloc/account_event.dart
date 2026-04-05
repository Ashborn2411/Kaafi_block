import 'package:equatable/equatable.dart';

import '../../../../../exports/data_paths.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class AccountInitialEvent extends AccountEvent {
  final CompleteDatabase database;
  const AccountInitialEvent(this.database);

  @override
  List<Object?> get props => [database];
}

class AccountLoadingEvent extends AccountEvent {}

class AccountLoadedEvent extends AccountEvent {
  final EssentialData data;
  const AccountLoadedEvent(this.data);

  @override
  List<Object?> get props => [data];
}

class AccountErrorEvent extends AccountEvent {
  final String message;
  const AccountErrorEvent(this.message);

  @override
  List<Object?> get props => [message];
}
