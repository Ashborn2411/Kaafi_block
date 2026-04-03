import 'package:flutter/material.dart';
import '/exports/data_paths.dart';

class ProfileWithEditButton extends StatelessWidget {
  const ProfileWithEditButton({super.key, required this.onpressd});
  final VoidCallback onpressd;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFEEEEEE),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Image(
                width: 80,
                height: 60,
                color: Color(0xFFBDBDBD),
                fit: BoxFit.contain,
                image: NetworkImage(''),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CustomIconButton(
              icon: Icons.edit,
              size: 18,
              minimumSize: const Size(30, 30),
              backgroundColor: Colors.white,
              iconColor: Colors.black,
              onPressed: onpressd,
            ),
          ),
        ),
      ],
    );
  }
}
