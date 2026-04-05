
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqHelp extends StatelessWidget {
  const FaqHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "FAQ/HELP ?",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.0, // equivalent to .tight
          ),
        ),
      ),
    );
  }
}
