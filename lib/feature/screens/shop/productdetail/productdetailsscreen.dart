import 'package:firstapp/core/bloc/database_states/database_abstract.dart';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_cubit.dart';
import 'bloc/product_state.dart';
import '../../../../core/bloc/database_cubit.dart';
import '../../../../core/utils/video_module/video_module.dart';
import '/exports/data_paths.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            courseId: id,
            userDataService: context.read<UserDataService>(),
            databaseCubit: context.read<DatabaseCubit>(),
            storage: context.read<SmallStorage>(),
          ),
        ),
      ],
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
          if (productState is ProductLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (productState is ProductLoaded) {
            final course = productState.course;
            return BlocProvider(
              create: (context) => VideoCubit(url: course.url),
              child: BlocListener<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state is ProductActionSuccess) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is ProductError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Scaffold(
                  bottomNavigationBar: const BottomNav(),
                  floatingActionButton: FloatingActionButton(
                    child: const Icon(Iconsax.message),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ai_Chat()),
                    ),
                  ),
                  appBar: AppBar(
                    surfaceTintColor: Colors.white,
                    title: const RoundedSearchBar(title: "Search Products"),
                    actions: [
                      IconButton(
                        onPressed: () => context.read<ProductCubit>().like(),
                        icon: Icon(
                          productState.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: const Color.fromARGB(255, 158, 4, 4),
                        ),
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BlocBuilder<VideoCubit, VideoState>(
                            builder: (context, videoState) {
                              final videoCubit = context.read<VideoCubit>();
                              if (videoState is VideoLoading) {
                                return const AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              if (videoState is VideoLoaded) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: videoState.aspectRatio,
                                      child: VideoPlayer(
                                        videoCubit.videoPlayerController,
                                      ),
                                    ),
                                    Center(
                                      child: IconButton(
                                        onPressed: () => videoCubit.playPause(),
                                        icon: Icon(
                                          videoState.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          size: 50,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            course.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TileandCollections(
                            titleontap: () {},
                            individualontap: () {},
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(height: 1, color: Color(0xFFEEEEEE)),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Keywords",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Variants(),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Uploaded by ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ShopNameAddressPriceButtons(
                            instructorName: course.instructorName,
                            onPressed: () =>
                                context.read<ProductCubit>().addToCart(),
                            enroll: () => context.read<ProductCubit>().enroll(),
                            rate: course.rating,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(course.description),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Related Courses",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Divider(thickness: 10, color: Color(0xFFF5F5F5)),
                        Container(
                          color: const Color(0xFFF5F5F5),
                          child: BlocBuilder<DatabaseCubit, DatabaseState>(
                            builder: (context, dbState) {
                              if (dbState is DatabaseLoaded) {
                                final list = dbState.database.courses;
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 320,
                                      ),
                                  itemCount: list.length > 4 ? 4 : list.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        final item = list[index];
                                        return ProductCardWithTag(
                                          id: item.courseId,
                                          title: item.title,
                                          price: item.price.toString(),
                                          enrolled: item.enrolled.toString(),
                                          rating: item.rating,
                                          url: item.thumbnail,
                                        );
                                      },
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(child: Text("Error loading course details")),
          );
        },
      ),
    );
  }
}
