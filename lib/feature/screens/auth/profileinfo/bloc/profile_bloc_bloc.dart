import 'package:firstapp/feature/screens/auth/profileinfo/bloc/profile_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_bloc_event.dart';

class ProfileBlocBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBlocBloc() : super(ProfileState()) {
    on<GenderSelectEvent>(_onGenderSelect);
    on<SelecDateEvent>(_dataSelect);
    on<SubmitEvent>(_onSubmit);
  }
  _onGenderSelect(GenderSelectEvent event, Emitter<ProfileState> emit) {
    emit(
      ProfileState(
        isMaleSelected: event.isMale,
        isFemaleSelected: !event.isMale,
      ),
    );
  }

  _dataSelect(SelecDateEvent event, Emitter<ProfileState> emit) {
    emit(ProfileState(dateOfBirth: event.date.toString()));
  }

  _onSubmit(SubmitEvent event, Emitter<ProfileState> emit) {}
}
