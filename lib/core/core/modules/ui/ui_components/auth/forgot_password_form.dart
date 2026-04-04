import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.mail),
              labelStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
