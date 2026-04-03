import 'package:equatable/equatable.dart';
import '../../../../../data/local/EssentialData/EssentialData.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final EssentialData data;

  const AccountLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class AccountError extends AccountState {
  final String message;
  const AccountError(this.message);

  @override
  List<Object?> get props => [message];
}
