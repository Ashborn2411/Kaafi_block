import 'dart:async';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Services/SupaBaseService/UserDataService/userDataService.dart';
import '../../../../../core/bloc/database_cubit.dart';
import '../../../../../data/local/EssentialData/EssentialData.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final String courseId;
  final UserDataService userDataService;
  final DatabaseCubit databaseCubit;
  final SmallStorage storage;

  ProductCubit({
    required this.courseId,
    required this.userDataService,
    required this.databaseCubit,
    required this.storage,
  }) : super(ProductInitial()) {
    _loadProduct();
  }

  void _loadProduct() {
    final databaseState = databaseCubit.state;
    if (databaseState is DatabaseLoaded) {
      final database = databaseState.database;
      final data = EssentialData(
        courseId: courseId,
        smallStorage: storage,
        database: database,
      );

      final course = data.course;
      final isLiked = data.wishlist.contains(courseId);
      final isInCart = data.cartList.contains(courseId);
      final isEnrolled = data.enrolledList.contains(courseId);

      emit(
        ProductLoaded(
          course: course,
          isLiked: isLiked,
          isInCart: isInCart,
          isEnrolled: isEnrolled,
        ),
      );
    }
  }

  Future<void> like() async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      try {
        final databaseState = databaseCubit.state;
        if (databaseState is DatabaseLoaded) {
          final data = EssentialData(
            courseId: courseId,
            smallStorage: storage,
            database: databaseState.database,
          );

          final newWishlist = List<String>.from(data.wishlist);
          if (newWishlist.contains(courseId)) {
            newWishlist.remove(courseId);
          } else {
            newWishlist.add(courseId);
          }

          await userDataService.updateWishlist(data.userId, newWishlist);
          await databaseCubit.refreshData();
          _loadProduct();
          emit(
            ProductActionSuccess(
              newWishlist.contains(courseId)
                  ? "Added to wishlist"
                  : "Removed from wishlist",
            ),
          );
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> addToCart() async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      try {
        final databaseState = databaseCubit.state;
        if (databaseState is DatabaseLoaded) {
          final data = EssentialData(
            courseId: courseId,
            smallStorage: storage,
            database: databaseState.database,
          );

          if (!data.cartList.contains(courseId)) {
            final newCartList = List<String>.from(data.cartList)..add(courseId);
            await userDataService.updateCartList(data.userId, newCartList);
            await databaseCubit.refreshData();
            _loadProduct();
            emit(const ProductActionSuccess("Added to cart"));
          }
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }

  Future<void> enroll() async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      try {
        final databaseState = databaseCubit.state;
        if (databaseState is DatabaseLoaded) {
          final data = EssentialData(
            courseId: courseId,
            smallStorage: storage,
            database: databaseState.database,
          );

          if (!data.enrolledList.contains(courseId)) {
            final newEnrolledList = List<String>.from(data.enrolledList)
              ..add(courseId);
            await userDataService.updateEnrollList(
              data.userId,
              newEnrolledList,
            );
            await databaseCubit.refreshData();
            _loadProduct();
            emit(const ProductActionSuccess("Enrolled successfully"));
          }
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    }
  }
}
