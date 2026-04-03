
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixfun,
    this.prefixfun,
    this.controller,
  });
  final String title;
  final TextEditingController? controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixfun;
  final bool obscureText;
  final VoidCallback? prefixfun;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(
          0xFF9E9E9E,
        ).withOpacity(0.1), // Vx.gray500.withOpacity(0.1)
        borderRadius: BorderRadius.circular(4), // roundedSM equivalent
      ),
      padding: const EdgeInsets.all(4), // p4 equivalent
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: title,
          hintStyle: TextStyle(
            color: const Color(
              0xFF212121,
            ).withOpacity(0.5), // Vx.gray900.withOpacity(0.5)
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixfun, icon: Icon(suffixIcon))
              : null,
          prefixIcon: prefixfun == null
              ? Icon(prefixIcon)
              : IconButton(onPressed: prefixfun, icon: Icon(prefixIcon)),
        ),
      ),
    );
  }
}
