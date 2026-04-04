import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Loaders {
  static void hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static void successSnackBar(BuildContext context,
      {required String title, String message = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.green),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title${message.isNotEmpty ? ': $message' : ''}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[500],
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void warningSnackBar(BuildContext context,
      {required String title, String message = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.warning, color: Colors.yellow),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title${message.isNotEmpty ? ': $message' : ''}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[500],
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void errorSnackBar(BuildContext context,
      {required String title, String message = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Iconsax.warning_2, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$title${message.isNotEmpty ? ': $message' : ''}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[500],
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void notificationSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No image selected"),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
