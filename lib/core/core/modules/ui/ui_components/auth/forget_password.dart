import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        "Forget Password".text.blue500
            .size(16)
            .semiBold
            .make()
            .onTap(
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
              ),
            ),
      ],
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(child: Text('Forgot Password screen placeholder')),
    );
  }
}
