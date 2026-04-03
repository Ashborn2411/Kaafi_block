import 'package:equatable/equatable.dart';

class NavigationState {
  final int index;
  final String? routeName;
  final Map<String, dynamic>? args;
  final List<int> history;
  final DateTime timestamp;

  NavigationState(
    this.index, {
    this.routeName,
    this.args,
    this.history = const [],
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  NavigationState copyWith({
    int? index,
    String? routeName,
    Map<String, dynamic>? args,
    List<int>? history,
    DateTime? timestamp,
  }) {
    return NavigationState(
      index ?? this.index,
      routeName: routeName ?? this.routeName,
      args: args ?? this.args,
      history: history ?? this.history,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  @override
  String toString() =>
      'NavigationState(index: $index, routeName: $routeName, args: $args, history: $history, timestamp: $timestamp)';
}
