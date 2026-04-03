
import 'package:flutter/material.dart';

class Auth_text_field extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final bool obscure;
  final IconData icondata;
  final String? Function(String?)? function;
  final TextEditingController controller;


  final Widget? suffixIcon;

  const Auth_text_field({
    super.key,
    required this.hinttext,
    required this.labeltext,
    this.obscure = false,
    required this.icondata,
    required this.controller,
    this.function,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: function,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: Icon(icondata),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
