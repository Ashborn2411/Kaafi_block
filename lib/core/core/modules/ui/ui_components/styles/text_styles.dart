import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppTextStyles {
  // Common text styles used throughout the app
  static const TextStyle labelStyle = TextStyle(
    color: Vx.gray500,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle statusText = TextStyle(
    color: Vx.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static const TextStyle subtitleText = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    color: Vx.gray600,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Vx.gray800,
  );

  static const TextStyle bodyTextGray = TextStyle(
    fontSize: 16,
    color: Vx.gray700,
  );

  static const TextStyle linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Vx.gray600,
  );

  static const TextStyle secondaryText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Vx.gray500,
  );

  static const TextStyle dividerText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Vx.gray500,
  );
}
