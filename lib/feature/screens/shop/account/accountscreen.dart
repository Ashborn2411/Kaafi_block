import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/account_cubit.dart';
import 'bloc/account_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is AccountLoaded) {
          final data = state.data;
          return Scaffold(
            bottomNavigationBar: const BottomNav(),
            appBar: AppBar(
              title: const Text(
                "Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_rounded),
                ),
              ],
            ),
            body: Column(
              children: [
                Center(
                  child: ProfileWithEditButton(
                    onpressd: () {
                      context.read<UserDataService>().uploadImage(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                TitleText(title: data.userName, size: 20),
                Text(
                  data.email,
                  style: const TextStyle(
                    color: Color(0xFF9E9E9E),
                  ),
                ),
                const SizedBox(height: 20),
                const FourButtonRow(),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 8,
                  color: Color(0xFFF5F5F5),
                ),
                const Expanded(child: Fourtitleswithicon()),
              ],
            ),
          );
        }
        return const Scaffold(body: Center(child: Text("Error loading account data")));
      },
    );
  }
}



