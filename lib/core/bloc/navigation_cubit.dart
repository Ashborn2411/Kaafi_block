import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(0, routeName: "home"));

  void setSelectedIndex(
    int index, {
    String? routeName,
    Map<String, dynamic>? args,
  }) {
    final updatedHistory = List<int>.from(state.history)..add(state.index);
    emit(
      NavigationState(
        index,
        routeName: routeName,
        args: args,
        history: updatedHistory,
      ),
    );
  }

  void goBack() {
    if (state.history.isNotEmpty) {
      final updatedHistory = List<int>.from(state.history);
      final previousIndex = updatedHistory.removeLast();
      emit(state.copyWith(index: previousIndex, history: updatedHistory));
    }
  }

  void resetToHome() {
    emit(NavigationState(0, routeName: "home", history: []));
  }

  void navigateTo(String routeName, {Map<String, dynamic>? args}) {
    // You can map routeName to index if needed
    final index = _mapRouteToIndex(routeName);
    setSelectedIndex(index, routeName: routeName, args: args);
  }

  int _mapRouteToIndex(String routeName) {
    switch (routeName) {
      case "home":
        return 0;
      case "settings":
        return 1;
      case "profile":
        return 2;
      default:
        return 0;
    }
  }
}
