part of 'cart_bloc.dart';

abstract class CartEvent {}

class GetAllCartsEvent extends CartEvent {}

class GetSingleCartEvent extends CartEvent {
  final int id;
  GetSingleCartEvent({required this.id});
}

class CreateCartEvent extends CartEvent {}

class UpdateCartEvent extends CartEvent {}

class PatchCartEvent extends CartEvent {}

class DeleteCartEvent extends CartEvent {}
