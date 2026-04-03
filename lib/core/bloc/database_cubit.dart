import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/mainDataModel/MainDataClass.dart';
import '../Services/DataBaseService/CenterDataBase/Database_service.dart';
import 'database_state.dart';

Map<String, dynamic> _extractData(CompleteDatabase data) {
  return {
    'courses': data.courses,
    'categories': data.categories,
    'certificates': data.certificates,
    'forums': data.forums,
    'instructors': data.instructors,
    'enrollments': data.enrollments,
    'payments': data.payments,
    'posts': data.posts,
    'questions': data.questions,
    'quizzes': data.quizzes,
    'reviews': data.reviews,
    'sections': data.sections,
    'students': data.students,
    'lessons': data.lessons,
    'notifications': data.notifications,
  };
}

class DatabaseCubit extends Cubit<DatabaseState> {
  final MainDatabase _databaseService;

  DatabaseCubit(this._databaseService) : super(DatabaseInitial()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(DatabaseLoading());
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
