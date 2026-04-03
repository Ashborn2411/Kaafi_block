import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/account_cubit.dart';
import '../bloc/account_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({
    super.key,
    required this.list,
    this.title = "Wishlist",
  });

  final List list;
  final String title;

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
            appBar: AppBar(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.deepPurpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: list.isEmpty 
                  ? const Center(child: Text("List is empty"))
                  : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Course course = data.getCourseById(list[index]);
                  return Dismissible(
                    key: ValueKey(course.courseId),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.redAccent,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      // TODO: remove from wishlist logic in AccountCubit
                    },
                    child: WishListComponent(
                      title: course.title,
                      price: course.price.toString(),
                      url: course.thumbnail,
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const Scaffold(body: Center(child: Text("Error loading data")));
      },
    );
  }
}

class WishListComponent extends StatelessWidget {
  final String title;
  final String price;
  final String url;

  const WishListComponent({
    super.key,
    required this.title,
    required this.price,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 60),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Price: $price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.deepPurple),
              onPressed: () {
                // TODO: move to cart logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
