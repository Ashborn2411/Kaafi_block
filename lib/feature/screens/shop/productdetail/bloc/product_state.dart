import 'package:equatable/equatable.dart';
import '/exports/data_paths.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Course course;
  final bool isLiked;
  final bool isInCart;
  final bool isEnrolled;

  const ProductLoaded({
    required this.course,
    required this.isLiked,
    required this.isInCart,
    required this.isEnrolled,
  });

  @override
  List<Object?> get props => [course, isLiked, isInCart, isEnrolled];
}

class ProductActionSuccess extends ProductState {
  final String message;
  const ProductActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
