
import 'package:flutter/material.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.borderColor = Colors.black,
    required this.title,
    this.applyborder = false,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
    this.textcolor = Colors.white,
    required this.onPressed,
    this.leadingicon = "",
  });

  final Color borderColor;
  final String title;
  final bool applyborder;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color textcolor;
  final VoidCallback onPressed;
  final String? leadingicon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: const Size(double.infinity, 50),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: applyborder
                ? BorderSide(color: borderColor, width: 1.0)
                : BorderSide.none,
          ),
        ),
        child: leadingicon != ""
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 0,
                    child: Image(
                      image: AssetImage(leadingicon!),
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: textcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
