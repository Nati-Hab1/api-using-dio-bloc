import 'package:api_using_dio_bloc/models/cart.dart';
import 'package:api_using_dio_bloc/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<GetAllCartsEvent>(_onGetAllCarts);
    on<GetSingleCartEvent>(_onGetSingleCart);
    on<CreateCartEvent>(_onCreateCart);
    on<UpdateCartEvent>(_onUpdateCart);
    on<PatchCartEvent>(_onPatchCart);
    on<DeleteCartEvent>(_onDeleteCart);
  }

  Future<void> _onGetAllCarts(
    GetAllCartsEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final carts = await ApiService.getCarts();
      emit(CartAllLoaded(count: carts.length));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }

  Future<void> _onGetSingleCart(
    GetSingleCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final cart = await ApiService.getCart(event.id);
      emit(CartLoaded(cart: cart, action: 'Fetched'));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }

  Future<void> _onCreateCart(
    CreateCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final cart = await ApiService.createCart([
        {"id": 144, "quantity": 4},
        {"id": 98, "quantity": 1},
      ]);
      emit(CartLoaded(cart: cart, action: 'Created'));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }

  Future<void> _onUpdateCart(
    UpdateCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final cart = await ApiService.updateCart(2, [
        {
          "id": 1,
          "title": "Essence Mascara Lash Princess",
          "price": 9.99,
          "quantity": 1,
          "thumbnail":
              "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
        },
      ]);
      emit(CartLoaded(cart: cart, action: 'Updated'));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }

  Future<void> _onPatchCart(
    PatchCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading());
      final cart = await ApiService.patchCart(2, [
        {"id": 1, "quantity": 6},
      ]);
      emit(CartLoaded(cart: cart, action: 'Patched'));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }

  Future<void> _onDeleteCart(
    DeleteCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(CartLoading(message: 'Deleting Cart...'));
      final isDeleted = await ApiService.deleteCart(1);
      emit(CartDeleted(isDeleted: isDeleted));
    } catch (e) {
      emit(CartError(message: 'Error: $e'));
    }
  }
}
