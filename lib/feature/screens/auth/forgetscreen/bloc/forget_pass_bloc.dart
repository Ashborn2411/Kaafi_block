import 'package:firstapp/feature/screens/auth/forgetscreen/bloc/forget_pass_event.dart';
import 'package:firstapp/feature/screens/auth/forgetscreen/bloc/forget_pass_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  ForgetPassBloc() : super(const ForgetPassInitial()) {
    on<ForgetPassRequested>(_onForgetPassRequested);
  }
  Future<void> _onForgetPassRequested(
    ForgetPassRequested event,
    Emitter<ForgetPassState> emit,
  ) async {
    emit(const ForgetPassLoading());
    final SupabaseClient supabase = Supabase.instance.client;
    try {
      await supabase.auth.resetPasswordForEmail(event.email);
      emit(const ForgetPassSuccess());
    } catch (e) {
      emit(ForgetPassFailure(e.toString()));
    }
  }
}
