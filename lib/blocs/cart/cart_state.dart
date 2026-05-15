part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {
  final String message;
  CartInitial({
    this.message = 'Press a button to make API request',
  });
}

class CartLoading extends CartState {
  final String message;
  CartLoading({this.message = 'Loading...'});
}

class CartAllLoaded extends CartState {
  final int count;
  CartAllLoaded({required this.count});
}

class CartLoaded extends CartState {
  final Cart cart;
  final String action;
  CartLoaded({required this.cart, required this.action});
}

class CartDeleted extends CartState {
  final bool isDeleted;
  CartDeleted({required this.isDeleted});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
