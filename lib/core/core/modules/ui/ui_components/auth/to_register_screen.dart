import 'package:flutter/material.dart';

class ToRegisterScreen extends StatelessWidget {
  const ToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have Account? ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey[500],
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RegisterScreen()),
          ),
          child: Text(
            "Register Here",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Center(child: Text('Register screen placeholder')),
    );
  }
}
