import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/database_cubit.dart';
import '../../../../../core/bloc/database_state.dart';
import '../../../../../data/local/EssentialData/EssentialData.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import '../../../../../data/models/mainDataModel/MainDataClass.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final DatabaseCubit databaseCubit;
  final SmallStorage storage;
  StreamSubscription? _databaseSubscription;

  CartCubit({required this.databaseCubit, required this.storage})
    : super(CartInitial()) {
    _databaseSubscription = databaseCubit.stream.listen((state) {
      if (state is DatabaseLoaded) {
        _updateData(state.database);
      }
    });

    // Initial load if database is already loaded
    if (databaseCubit.state is DatabaseLoaded) {
      _updateData((databaseCubit.state as DatabaseLoaded).database);
    }
  }

  void _updateData(CompleteDatabase database) {
    final data = EssentialData(
      courseId: '',
      smallStorage: storage,
      database: database,
    );

    double totalCost = 0.0;
    for (String id in data.cartList) {
      try {
        final course = data.getCourseById(id);
        totalCost += course.price;
      } catch (e) {
        // Handle missing course if necessary
      }
    }

    emit(CartLoaded(data: data, totalCost: totalCost));
  }

  @override
  Future<void> close() {
    _databaseSubscription?.cancel();
    return super.close();
  }
}
