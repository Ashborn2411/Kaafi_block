import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key, this.isUpdate = false});
  final bool isUpdate;

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  bool isManTapped = false;
  bool isWomanTapped = false;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _handleDateSelection(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (selectedDate != null) {
      final dateOnly = selectedDate.toIso8601String().split('T')[0];
      _dateController.text = dateOnly;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isUpdate ? AppBar() : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!widget.isUpdate) const SizedBox(height: 60),
              TitleText(
                title: (!widget.isUpdate)
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
              const CustomTextField(
                title: StringCons.fullName,
                prefixIcon: Icons.person,
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
              const CustomTextField(
                title: StringCons.phoneNumber,
                prefixIcon: Icons.phone,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  GenderCard(
                    gender: StringCons.male,
                    ontap: () {
                      setState(() {
                        isManTapped = !isManTapped;
                        if (isManTapped) {
                          isWomanTapped = false;
                        }
                      });
                    },
                    iconData: Icons.man,
                    istaped: isManTapped,
                  ),
                  const SizedBox(width: 20),
                  GenderCard(
                    gender: StringCons.female,
                    ontap: () {
                      setState(() {
                        isWomanTapped = !isWomanTapped;
                        if (isWomanTapped) {
                          isManTapped = false;
                        }
                      });
                    },
                    iconData: Icons.woman,
                    istaped: isWomanTapped,
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
                prefixfun: () => _handleDateSelection(context),
              ),
              const SizedBox(height: 16.0),
              CustomElevatedButton(
                title: widget.isUpdate ? 'Update' : StringCons.completeProfile,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.ontap,
    required this.iconData,
    required this.istaped,
    required this.gender,
  });

  final VoidCallback ontap;
  final IconData iconData;
  final bool istaped;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: istaped ? 1 : 0.2),
            ),
            height: 70,
            width: 70,
            child: Center(child: Icon(iconData, size: 50)),
          ),
          const SizedBox(height: 4),
          Text(
            gender,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF616161),
            ),
          ),
        ],
      ),
    );
  }
}
