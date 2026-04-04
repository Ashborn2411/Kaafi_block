import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import '../event/login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SupabaseClient supabase;
  final SmallStorage storage;

  LoginBloc({required this.supabase, required this.storage})
    : super(const LoginInitial()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SignInRequested>(_onSignInRequested);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    final isCurrentlyObscured = _getIsObscured();
    if (state is LoginInitial) {
      emit(LoginInitial(isObscured: !isCurrentlyObscured));
    } else if (state is LoginLoading) {
      emit(LoginLoading(isObscured: !isCurrentlyObscured));
    }
  }

  bool _getIsObscured() {
    if (state is LoginInitial) {
      return (state as LoginInitial).isObscured;
    } else if (state is LoginLoading) {
      return (state as LoginLoading).isObscured;
    }
    return true;
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<LoginState> emit,
  ) async {
    final isCurrentlyObscured = _getIsObscured();
    emit(LoginLoading(isObscured: isCurrentlyObscured));
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );

      final User? user = res.user;
      if (user != null) {
        storage.writeIfNull("email", user.email);
        storage.writeIfNull("id", user.id);
        storage.writeIfNull("login", true);
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure("Login failed: User is null"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
