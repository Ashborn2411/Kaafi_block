import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../account/bloc/account_bloc.dart';
import '../../../account/bloc/account_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyDrawer({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.5,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AccountLoaded) {
              final data = state.data;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      const SizedBox(height: 20.0),
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Color(0xFFE0E0E0),
                        backgroundImage: AssetImage(ImageCons.person),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        data.userName,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        data.email,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomListTitle(
                    title: 'Enrolled',
                    icon: Icons.request_page_outlined,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Wishlist(list: data.enrolledList),
                        ),
                      );
                      scaffoldKey.currentState?.closeDrawer();
                    },
                  ),
                  CustomListTitle(
                    title: 'Wishlist',
                    icon: Icons.favorite_border_outlined,
                    ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wishlist(list: data.wishlist),
                      ),
                    ),
                  ),
                  CustomListTitle(
                    title: 'Chat with KAFFI Bot',
                    icon: Icons.chat,
                    ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AiChat()),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("Error loading account data"));
          },
        ),
      ),
    );
  }
}
