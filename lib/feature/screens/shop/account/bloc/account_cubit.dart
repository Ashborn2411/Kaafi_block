import 'dart:async';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:firstapp/data/local/EssentialData/EssentialData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/database_cubit.dart';
import '../../../../../data/local/LocalStorage/smallStorage.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final DatabaseCubit databaseCubit;
  final SmallStorage storage;
  StreamSubscription? _databaseSubscription;

  AccountCubit({required this.databaseCubit, required this.storage})
    : super(AccountInitial()) {
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
      AccountLoaded(
        EssentialData(courseId: '', smallStorage: storage, database: database),
      ),
    );
  }

  @override
  Future<void> close() {
    _databaseSubscription?.cancel();
    return super.close();
  }
}
