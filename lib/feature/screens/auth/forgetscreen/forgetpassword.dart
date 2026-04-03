import '/exports/data_paths.dart';

import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(title: StringCons.forgotpass),
              const SizedBox(height: 10), // 10.heightBox replacement
              Text(
                StringCons.fogetpasstitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF616161), // gray700 equivalent
                ),
              ),
              const SizedBox(height: 30), // 30.heightBox replacement
              const CustomTextField(
                title: StringCons.emailaddress,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 20), // 20.heightBox replacement
              CustomElevatedButton(title: StringCons.continu, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
