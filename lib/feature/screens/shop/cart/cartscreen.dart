import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cart_cubit.dart';
import 'bloc/cart_state.dart';
import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class CartSrceen extends StatelessWidget {
  const CartSrceen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CartLoaded) {
          final data = state.data;
          final totalCost = state.totalCost;

          return Scaffold(
            bottomSheet: SizedBox(
              width: w,
              child: BottomTitle(value: totalCost),
            ),
            bottomNavigationBar: const BottomNav(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: const TitleText(title: 'Shopping Cart', size: 22),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline, size: 30),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: data.cartList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            ListView.separated(
                              itemCount: data.cartList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                    return const SizedBox(height: 10);
                                  },
                              itemBuilder: (BuildContext context, int index) {
                                Course c = data.getCourseById(
                                  data.cartList[index],
                                );
                                return WishListComponent(
                                  title: c.title,
                                  price: c.price.toString(),
                                  url: c.thumbnail,
                                );
                              },
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const Center(
                            child: Image(
                              image: AssetImage(ImageCons.cart),
                              width: 300,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Nothing to add to Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9E9E9E),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
            ),
          );
        }
        return const Scaffold(body: Center(child: Text("Error loading cart")));
      },
    );
  }
}
