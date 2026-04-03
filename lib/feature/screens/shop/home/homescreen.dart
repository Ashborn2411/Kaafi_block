import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_cubit.dart';
import 'bloc/home_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is HomeLoaded) {
          final data = state.data;
          return Scaffold(
            key: homeScaffoldKey,
            bottomNavigationBar: const BottomNav(),
            appBar: homeAppBar(homeScaffoldKey),
            drawer: MyDrawer(scaffoldKey: homeScaffoldKey),
            body: CustomScrollView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    switch (index) {
                      case 0:
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: BannerCarousel(
                            height: 200,
                            imagePaths: [
                              ImageCons.banner1,
                              ImageCons.banner1,
                              ImageCons.banner1,
                            ],
                          ),
                        );
                      case 1:
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Part1(list: data.courselist),
                        );
                      case 2:
                        return const SizedBox(height: 10);
                      case 3:
                        return Part2(list: data.courselist);
                      default:
                        return Container();
                    }
                  }, childCount: 4),
                ),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text("Error loading home data")),
        );
      },
    );
  }
}
