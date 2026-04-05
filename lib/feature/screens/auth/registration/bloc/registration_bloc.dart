import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SupabaseClient supabase;
  final SmallStorage storage;

  RegisterBloc({required this.supabase, required this.storage})
    : super(const RegisterInitial()) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SignUpRequested>(_onSignUpRequested);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<RegisterState> emit,
  ) {
    final isCurrentlyObscured = _getIsObscured();
    if (state is RegisterInitial) {
      emit(RegisterInitial(isObscured: !isCurrentlyObscured));
    } else if (state is RegisterLoading) {
      emit(RegisterLoading(isObscuredPassword: !isCurrentlyObscured));
    }
  }

  void _onToggleConfirmPasswordVisibility(
    ToggleConfirmPasswordVisibility event,
    Emitter<RegisterState> emit,
  ) {
    final isConfirmObscured = _getIsRegisterObscured();
    if (state is RegisterInitial) {
      emit(RegisterInitial(isConfirmObscured: !isConfirmObscured));
    } else if (state is RegisterLoading) {
      emit(RegisterLoading(isObscuredConfirmPassword: !isConfirmObscured));
    }
  }

  bool _getIsObscured() {
    if (state is RegisterInitial) {
      return (state as RegisterInitial).isObscured;
    } else if (state is RegisterLoading) {
      return (state as RegisterLoading).isObscuredPassword;
    }
    return true;
  }

  bool _getIsRegisterObscured() {
    if (state is RegisterInitial) {
      return (state as RegisterInitial).isConfirmObscured;
    } else if (state is RegisterLoading) {
      return (state as RegisterLoading).isObscuredConfirmPassword;
    }
    return true;
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<RegisterState> emit,
  ) async {
    final isCurrentlyObscured = _getIsObscured();
    final isConfirmObscured = _getIsRegisterObscured();
    emit(
      RegisterLoading(
        isObscuredPassword: isCurrentlyObscured,
        isObscuredConfirmPassword: isConfirmObscured,
      ),
    );
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: event.email,
        password: event.password,
      );

      final User? user = res.user;
      if (user != null) {
        storage.writeIfNull("email", user.email);
        storage.writeIfNull("id", user.id);
        storage.writeIfNull("registered", true);
        storage.writeIfNull("name", event.name);
        storage.writeIfNull("phone_number", event.phone_number);
        emit(RegisterSuccess());
      } else {
        emit(const RegisterFailure("Registration failed: User is null"));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
