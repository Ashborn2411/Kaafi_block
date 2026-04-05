import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/core/bloc/database_cubit.dart';
import 'package:firstapp/core/bloc/database_states/database_loaded.dart';
import 'package:firstapp/data/local/EssentialData/EssentialData.dart';
import 'package:firstapp/data/local/LocalStorage/smallStorage.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final DatabaseCubit databaseCubit;
  final SmallStorage storage;
  StreamSubscription? _databaseSubscription;

  AccountBloc({required this.databaseCubit, required this.storage})
    : super(AccountInitial()) {
    on<AccountInitialEvent>(_onAccountInitialEvent);
    on<AccountLoadingEvent>(_onAccountLoadingEvent);
    on<AccountLoadedEvent>(_onAccountLoadedEvent);
    on<AccountErrorEvent>(_onAccountErrorEvent);

    _databaseSubscription = databaseCubit.stream.listen((state) {
      if (state is DatabaseLoaded) {
        add(
          AccountLoadedEvent(
            EssentialData(
              courseId: '',
              smallStorage: storage,
              database: state.database,
            ),
          ),
        );
      }
    });

    if (databaseCubit.state is DatabaseLoaded) {
      final dbState = databaseCubit.state as DatabaseLoaded;
      add(
        AccountLoadedEvent(
          EssentialData(
            courseId: '',
            smallStorage: storage,
            database: dbState.database,
          ),
        ),
      );
    }
  }

  void _onAccountInitialEvent(
    AccountInitialEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(AccountInitial());
  }

  void _onAccountLoadingEvent(
    AccountLoadingEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(AccountLoading());
  }

  void _onAccountLoadedEvent(
    AccountLoadedEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(AccountLoaded(event.data));
  }

  void _onAccountErrorEvent(
    AccountErrorEvent event,
    Emitter<AccountState> emit,
  ) {
    emit(AccountError(event.message));
  }

  @override
  Future<void> close() {
    _databaseSubscription?.cancel();
    return super.close();
  }
}
