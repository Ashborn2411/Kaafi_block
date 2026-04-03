import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/navigation_cubit.dart';
import 'core/bloc/navigation_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, this.applyPop = false});
  final bool applyPop;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) {
                context.read<NavigationCubit>().setSelectedIndex(index);
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, AppRoutes.campaign);
                    break;
                  case 2:
                    Navigator.pushReplacementNamed(context, AppRoutes.cart);
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, AppRoutes.account);
                    break;
                }
              },
              backgroundColor: Colors.white,
              indicatorColor: Colors.white,
              destinations: List.generate(
                4,
                (index) => buildNavigationDestination(
                  index,
                  state.selectedIndex == index,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildNavigationDestination(int index, bool isSelected) {
  final icon = _getIcon(index);
  return NavigationDestination(
    icon: isSelected
        ? Icon(icon, color: Colors.black)
        : Icon(icon, color: const Color(0xFF9E9E9E)),
    label: _getLabel(index),
  );
}

IconData _getIcon(int index) {
  switch (index) {
    case 0:
      return Icons.home_outlined;
    case 1:
      return Icons.discount_outlined;
    case 2:
      return Icons.shopping_cart_outlined;
    case 3:
      return Iconsax.user;
    default:
      throw Exception('Invalid index for NavigationDestination');
  }
}

String _getLabel(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Campaign';
    case 2:
      return 'Cart';
    case 3:
      return 'Account';
    default:
      throw Exception('Invalid index for NavigationDestination label');
  }
}
