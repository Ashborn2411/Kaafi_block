import 'package:firstapp/core/bloc/database_states/database_abstract.dart';
import 'package:firstapp/core/bloc/database_states/database_error.dart';
import 'package:firstapp/core/bloc/database_states/database_init.dart';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:firstapp/core/bloc/database_states/database_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/mainDataModel/MainDataClass.dart';
import '../Services/DataBaseService/CenterDataBase/database_service.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  final MainDatabase _databaseService;
  DatabaseCubit(this._databaseService)
    : super(DatabaseInitial(message: 'Database is initializing')) {
    loadData();
  }

  Future<void> loadData() async {
    emit(DatabaseLoading('Loading data'));
    try {
      final data = _databaseService.getData;
      if (data != CompleteDatabase.emptydata) {
        emit(DatabaseLoaded(data));
      } else {
        final fetchedData = await _databaseService.fetchData();
        emit(DatabaseLoaded(fetchedData));
      }
    } catch (e) {
      emit(DatabaseError(e.toString()));
    }
  }

  Future<void> refreshData() async {
    try {
      await _databaseService.refresh();
      final data = _databaseService.getData;
      emit(DatabaseLoaded(data));
    } catch (e) {
      emit(DatabaseError(e.toString()));
    }
  }

  CompleteDatabase get currentDatabase {
    if (state is DatabaseLoaded) {
      return (state as DatabaseLoaded).database;
    }
    return CompleteDatabase.emptydata;
  }
}
