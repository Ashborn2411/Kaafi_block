import 'package:equatable/equatable.dart';
import '../../../../../data/local/EssentialData/EssentialData.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final EssentialData data;
  final double totalCost;

  const CartLoaded({required this.data, required this.totalCost});

  @override
  List<Object?> get props => [data, totalCost];
}

class CartError extends CartState {
  final String message;
  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
