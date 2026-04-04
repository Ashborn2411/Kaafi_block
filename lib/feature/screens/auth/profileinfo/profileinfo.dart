import 'package:firstapp/common/button/customelevatedbutton.dart';
import 'package:firstapp/common/text/titletext.dart';
import 'package:firstapp/common/textfield/customtextfield.dart';
import 'package:firstapp/core/Constants/stringconstant.dart';
import 'package:firstapp/feature/screens/auth/profileinfo/bloc/profile_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc_bloc.dart';
import 'bloc/profile_bloc_state.dart';
import 'widget/gender_card.dart';

class CompleteProfileScreen extends StatefulWidget {
  final bool isUpdated;
  const CompleteProfileScreen({super.key, required this.isUpdated});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBlocBloc(),

      child: Scaffold(
        appBar: widget.isUpdated ? AppBar() : null,
        body: BlocBuilder<ProfileBlocBloc, ProfileState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!widget.isUpdated) const SizedBox(height: 60),
                    TitleText(
                      title: (!widget.isUpdated)
                          ? StringCons.ppyitoprocced
                          : 'Edit Profile',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      StringCons.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      title: StringCons.fullName,
                      prefixIcon: Icons.person,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      StringCons.phoneNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      title: StringCons.phoneNumber,
                      prefixIcon: Icons.phone,
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GenderCard(
                          gender: StringCons.male,
                          ontap: () => context.read<ProfileBlocBloc>().add(
                            GenderSelectEvent(isMale: true),
                          ),
                          iconData: Icons.man,
                          istaped: state.isMaleSelected,
                        ),
                        const SizedBox(width: 20),
                        GenderCard(
                          gender: StringCons.female,
                          ontap: () => context.read<ProfileBlocBloc>().add(
                            GenderSelectEvent(isMale: false),
                          ),
                          iconData: Icons.woman,
                          istaped: state.isFemaleSelected,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      StringCons.dateOfBirth,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _dateController,
                      title: StringCons.enterYourDateOfBirth,
                      prefixIcon: Icons.edit_calendar,
                      prefixfun: () async {
                        final selectDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        (selectDate != null)
                            ? context.read<ProfileBlocBloc>().add(
                                SelecDateEvent(date: selectDate),
                              )
                            : null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomElevatedButton(
                      title: widget.isUpdated
                          ? 'Update'
                          : StringCons.completeProfile,
                      onPressed: () => context.read<ProfileBlocBloc>().add(
                        SubmitEvent(
                          date: state.dateOfBirth ?? "",
                          name: _nameController.text,
                          phone: _phoneController.text,
                          isMale: state.isMaleSelected,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
