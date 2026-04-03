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
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                          function: (value) => Validator.validateEmail(value),
                          controller: _emailController,
                          hinttext: 'Enter your email',
                          labeltext: 'Email',
                          icondata: Icons.mail,
                        ),
                        const SizedBox(height: 16),
                        Auth_text_field(
                          function: (value) => Validator.validatePassword(value),
                          labeltext: 'Password',
                          controller: _passwordController,
                          hinttext: 'Enter your password',
                          obscure: true,
                          icondata: Icons.lock,
                        ),
                        const SizedBox(height: 16),
                        Auth_text_field(
                          controller: _confirmPasswordController,
                          hinttext: 'Confirm Password',
                          labeltext: 'Retype your password',
                          icondata: Icons.lock,
                          obscure: true,
                        ),
                        const SizedBox(height: 24),
                        Custom_Auth_Button(
                          title: 'Register',
                          function: _register,
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
    );
  }
}
