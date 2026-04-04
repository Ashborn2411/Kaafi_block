import 'package:firstapp/feature/screens/auth/forgetscreen/bloc/forget_pass_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

import 'bloc/forget_pass_bloc.dart';
import 'bloc/forget_pass_state.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    return BlocProvider(
      create: (context) => ForgetPassBloc(),
      child: SafeArea(
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
                const SizedBox(height: 30),
                CustomTextField(
                  title: StringCons.emailaddress,
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                ),
                const SizedBox(height: 20), // 20.heightBox replacement
                BlocBuilder<ForgetPassBloc, ForgetPassState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      title: StringCons.continu,
                      onPressed: () => context.read<ForgetPassBloc>().add(
                        ForgetPassRequested(email: _emailController.text),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
