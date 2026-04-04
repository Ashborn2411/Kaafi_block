import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/exports/data_paths.dart';

class AppRoutes {
  static const home = '/home';
  static const product = '/product';
  static const cart = '/cart';
  static const account = '/account';
  static const pageloader = '/pageloader';
  static const campaign = '/campaign';
  static const register = '/register';
  static const profileinfo = '/profileinfo';
  static const login = '/login';
  static const forgetpass = '/forgetpass';

  static Map<String, WidgetBuilder> get routes => {
    pageloader: (context) {
      if (SmallStorage.instance.read("login") != true) {
        return PagesLoader(
          dotlottieAssets: Assetspaths.assetspaths,
          titles: AppStrings.titles,
          textStyle: GoogleFonts.openSans(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        );
      } else {
        return const HomeScreen();
      }
    },
    home: (context) => const HomeScreen(),
    product: (context) => const ProductDetails(id: ''),
    cart: (context) => const CartSrceen(),
    account: (context) => const AccountScreen(),
    campaign: (context) => const CampaignScreen(),
    register: (context) => const RegisterView(),
    profileinfo: (context) => const CompleteProfileScreen(isUpdated: true),
    login: (context) => const LoginView(),
    forgetpass: (context) => const ForgetPassword(),
  };
}
