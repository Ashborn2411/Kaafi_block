// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// import '../../../validation/validators/validation.dart';
// import 'forget_password.dart';

// class LoginForm extends StatelessWidget {
//   const LoginForm({
//     super.key,
//     required this.email,
//     required this.password,
//     required this.showpassword,
//     required this.onpressed,
//   });
//   final TextEditingController email;
//   final TextEditingController password;
//   final bool showpassword;
//   final VoidCallback onpressed;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 320),
//           TextFormField(
//             validator: (value) => Validator.validateEmail(value),
//             controller: email,
//             decoration: InputDecoration(
//               labelText: 'Email',
//               prefixIcon: const Icon(Icons.mail),
//               labelStyle: TextStyle(
//                   color: Colors.grey[500], fontWeight: FontWeight.bold),
//               border: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16.0),
//           TextFormField(
//             validator: (value) => Validator.validatePassword(value),
//             controller: password,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               suffixIcon: IconButton(
//                   onPressed: onpressed,
//                   icon: showpassword
//                       ? const Icon(Iconsax.eye_slash)
//                       : const Icon(Iconsax.eye)),
//               prefixIcon: const Icon(Iconsax.lock),
//               labelStyle: TextStyle(
//                   color: Colors.grey[500], fontWeight: FontWeight.bold),
//               border: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//               ),
//             ),
//             obscureText: !showpassword,
//           ),
//           const SizedBox(height: 8),
//           const ForgetPassword()
//         ],
//       ),
//     );
//   }
// }
//   }
// }
