import 'package:firstapp/feature/screens/auth/login/event/login_event.dart'
    show LoginEvent, SignInRequested, TogglePasswordVisibility;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '/exports/data_paths.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LoginBloc(
        supabase: Supabase.instance.client,
        storage: SmallStorage.instance,
      ),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // Layer 1: Logo
              Positioned(
                top: screenHeight * 0.1,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    "assets/image/logo/logo_black.png",
                    height: screenHeight * 0.3,
                  ),
                ),
              ),

              // Layer 2: Form Container
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.6,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(194, 147, 232, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Auth_text_field(
                            obscure: false,
                            function: (value) => Validator.validateEmail(value),
                            controller: _emailController,
                            hinttext: "Enter your email",
                            labeltext: "Email",
                            icondata: Icons.mail,
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              bool obscure = true;
                              if (state is LoginInitial) {
                                obscure = state.isObscured;
                              } else if (state is LoginLoading) {
                                obscure = state.isObscured;
                              }
                              return Auth_text_field(
                                function: (value) =>
                                    Validator.validatePassword(value),
                                labeltext: "Password",
                                controller: _passwordController,
                                hinttext: "Enter your password",
                                obscure: obscure,
                                icondata: Icons.lock,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => context
                                      .read<LoginBloc>()
                                      .add(TogglePasswordVisibility()),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Custom_Auth_Button(
                                title: "Login",
                                function: () => context.read<LoginBloc>().add(
                                  SignInRequested(
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          Custom_Auth_Button(
                            title: "Register",
                            function: () => Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
