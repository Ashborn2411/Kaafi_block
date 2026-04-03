import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/bloc/home_cubit.dart';
import '../home/bloc/home_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is HomeLoaded) {
          final list = state.data.courselist;
          return Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            bottomNavigationBar: const BottomNav(),
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              title: const RoundedSearchBar(),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CardLogoBaner(title: "hello"),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w,
                        child: StickyHeader(
                          header: CustomHeader(sort: () {}, filter: () {}),
                          content: Container(
                            color: const Color(0xFFF5F5F5),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 320,
                              ),
                              itemCount: list.length > 10 ? 10 : list.length,
                              itemBuilder: (BuildContext context, int index) {
                                final course = list[index];
                                return ProductCardWithTag(
                                  id: course.courseId,
                                  title: course.title,
                                  price: course.price.toString(),
                                  enrolled: course.enrolled.toString(),
                                  rating: course.rating,
                                  url: course.thumbnail,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Scaffold(body: Center(child: Text("Error loading shop details")));
      },
    );
  }
}
