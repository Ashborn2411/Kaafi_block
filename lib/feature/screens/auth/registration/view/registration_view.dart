import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../bloc/registration_bloc.dart';
import '../bloc/registration_event.dart';
import '../bloc/registration_state.dart';
import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final SupabaseClient supabaseClient = Supabase.instance.client;
    final SmallStorage storage = SmallStorage();

    return BlocProvider(
      create: (context) =>
          RegisterBloc(supabase: supabaseClient, storage: storage),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is RegisterSuccess) {
            _nameController.clear();
            _emailController.clear();
            _passwordController.clear();
            _confirmPasswordController.clear();
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          } else if (state is RegisterFailure) {
            _passwordController.clear();
            _confirmPasswordController.clear();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.1,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: screenHeight * 0.25,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: 0.65,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 77, 255),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Auth_text_field(
                              hinttext: 'Enter your name',
                              labeltext: 'Username',
                              icondata: Icons.people,
                              controller: _nameController,
                            ),
                            const SizedBox(height: 16),
                            Auth_text_field(
                              obscure: false,
                              function: (value) =>
                                  Validator.validateEmail(value),
                              controller: _emailController,
                              hinttext: 'Enter your email',
                              labeltext: 'Email',
                              icondata: Icons.mail,
                            ),
                            const SizedBox(height: 16),
                            BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                final bool isObscured = state is RegisterInitial
                                    ? state.isObscured
                                    : true;
                                return Auth_text_field(
                                  function: (value) =>
                                      Validator.validatePassword(value),
                                  labeltext: 'Password',
                                  controller: _passwordController,
                                  hinttext: 'Enter your password',
                                  obscure: isObscured,
                                  icondata: Icons.lock,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => context
                                        .read<RegisterBloc>()
                                        .add(TogglePasswordVisibility()),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                final bool isConfirmObscured =
                                    state is RegisterInitial
                                    ? state.isConfirmObscured
                                    : true;
                                return Auth_text_field(
                                  controller: _confirmPasswordController,
                                  hinttext: 'Confirm Password',
                                  labeltext: 'Retype your password',
                                  icondata: Icons.lock,
                                  obscure: isConfirmObscured,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isConfirmObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => context
                                        .read<RegisterBloc>()
                                        .add(ToggleConfirmPasswordVisibility()),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                return Custom_Auth_Button(
                                  title: 'Register',
                                  function: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<RegisterBloc>().add(
                                        SignUpRequested(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                          _confirmPasswordController.text
                                              .trim(),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
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
