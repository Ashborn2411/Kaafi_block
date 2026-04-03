import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SupabaseClient supabase;
  final SmallStorage storage;

  LoginCubit({
    required this.supabase,
    required this.storage,
  }) : super(const LoginInitial());

  void togglePasswordVisibility() {
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

  Future<void> signIn(String email, String password) async {
    final isCurrentlyObscured = _getIsObscured();
    emit(LoginLoading(isObscured: isCurrentlyObscured));
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
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
