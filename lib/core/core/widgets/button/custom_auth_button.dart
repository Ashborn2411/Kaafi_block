import 'package:flutter/material.dart';

class Custom_Auth_Button extends StatelessWidget {
  final String title;
  final VoidCallback? function;
  const Custom_Auth_Button({super.key, this.function, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 50, 9, 122),
        foregroundColor: Colors.white,
        fixedSize: Size(120, 50),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 4,
      ),
      child: Text(title),
    );
  }
}
