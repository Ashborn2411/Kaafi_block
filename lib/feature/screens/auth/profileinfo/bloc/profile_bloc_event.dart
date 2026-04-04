import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenderSelectEvent extends ProfileEvent {
  final bool isMale;
  GenderSelectEvent({required this.isMale});

  @override
  // TODO: implement props
  List<Object?> get props => [isMale];
}

class SelecDateEvent extends ProfileEvent {
  final DateTime date;
  SelecDateEvent({required this.date});
  @override
  List<Object?> get props => [date];
}

class SubmitEvent extends ProfileEvent {
  final String date;
  final String name;
  final String phone;
  final bool isMale;
  SubmitEvent({
    required this.date,
    required this.name,
    required this.phone,
    required this.isMale,
  });

  @override
  List<Object?> get props => [date, name, phone, isMale];
}
