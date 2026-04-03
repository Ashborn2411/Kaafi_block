import 'dart:async';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/database_cubit.dart';
import '../../../../../data/local/EssentialData/EssentialData.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DatabaseCubit databaseCubit;
  final SmallStorage storage;
  StreamSubscription? _databaseSubscription;

  HomeCubit({required this.databaseCubit, required this.storage})
    : super(HomeInitial()) {
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

  void _updateData(dynamic database) {
    emit(
      HomeLoaded(
        EssentialData(
          courseId: '', // Default or home-specific
          smallStorage: storage,
          database: database,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _databaseSubscription?.cancel();
    return super.close();
  }
}
