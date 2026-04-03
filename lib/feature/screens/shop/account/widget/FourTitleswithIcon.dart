import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/account_cubit.dart';
import '../bloc/account_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class AccountMenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  AccountMenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class Fourtitleswithicon extends StatelessWidget {
  const Fourtitleswithicon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoaded) {
          final data = state.data;
          final List<AccountMenuItem> accountMenuItems = [
            AccountMenuItem(
              title: "Enrolled Courses",
              icon: Icons.school,
              color: const Color(0xFF4CAF50).withValues(alpha: 0.85),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Wishlist(
                      title: "Enrolled Courses",
                      list: data.enrolledList,
                    ),
                  ),
                );
              },
            ),
            AccountMenuItem(
              title: "Wishlist",
              icon: Icons.favorite_border_outlined,
              color: const Color(0xFFF44336),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Wishlist(
                      list: data.wishlist,
                    ),
                  ),
                );
              },
            ),
            AccountMenuItem(
              title: "Certificates",
              icon: Icons.contact_page,
              color: const Color(0xFFFFCA28),
              onTap: () {
                // TODO: Navigate to certificates page
              },
            ),
            AccountMenuItem(
              title: "Change Password",
              icon: Icons.password,
              color: const Color(0xFF2196F3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForgetPassword()),
                );
              },
            ),
          ];

          return ListView.builder(
            itemCount: accountMenuItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = accountMenuItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: IconListTitle(
                  title: item.title,
                  icon: item.icon,
                  color: item.color,
                  ontap: item.onTap,
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
