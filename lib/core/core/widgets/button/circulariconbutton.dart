
import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.backgroundColor = const Color(0xFFF5F5F5), // gray100 equivalent
    this.iconColor = Colors.white,
    required this.icon,
    required this.onPressed,
    this.size = 22,
    this.minimumSize,
    this.padding,
    this.borderRadius,
    this.splashColor,
    this.highlightColor,
    this.disabledColor = const Color(0xFF9E9E9E), // gray400 equivalent
    this.isDisabled = false,
  });

  final Color? backgroundColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isDisabled ? null : onPressed,
      style: IconButton.styleFrom(
        backgroundColor: isDisabled ? disabledColor : backgroundColor,
        minimumSize: minimumSize,
        padding: padding,
        shape: borderRadius != null
            ? RoundedRectangleBorder(borderRadius: borderRadius!)
            : null,
      ),
      splashColor: splashColor,
      highlightColor: highlightColor,
      icon: Icon(
        icon,
        size: size,
        color: isDisabled ? const Color(0xFF9E9E9E) : iconColor,
      ),
    );
  }
}
