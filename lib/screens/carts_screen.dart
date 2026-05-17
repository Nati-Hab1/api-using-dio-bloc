import 'dart:math';
import 'package:api_using_dio_bloc/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  String _chooseMessage(CartState state) {
    if (state is CartInitial) return state.message;
    if (state is CartLoading) return state.message;
    if (state is CartAllLoaded) {
      return 'Loaded ${state.count} carts';
    }
    if (state is CartDeleted) {
      return state.isDeleted
          ? 'Deleted cart successfully'
          : 'Cart deletion failed';
    }
    if (state is CartLoaded) {
      final cart = state.cart;
      return '${state.action} Cart: ${cart.id}\nUser Id: ${cart.userId}\nTotal Products: ${cart.totalProducts}\nTotal Quantity: ${cart.totalQuantity}\nTotal: ${cart.total}';
    }
    if (state is CartError) return state.message;
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts Page Using Dio and Bloc'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 150, 136),
        ),
        child: Center(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Scroll and choose an API request method",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                GetAllCartsEvent(),
                              );
                            },
                            child: const Text(
                              'GET All Carts',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 162,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              final id =
                                  Random().nextInt(30) + 1;
                              context.read<CartBloc>().add(
                                GetSingleCartEvent(id: id),
                              );
                            },
                            child: const Text(
                              'GET Random Cart',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                CreateCartEvent(),
                              );
                            },
                            child: const Text(
                              'CREATE Cart',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                UpdateCartEvent(),
                              );
                            },
                            child: const Text(
                              'UPDATE Cart',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                PatchCartEvent(),
                              );
                            },
                            child: const Text(
                              'PATCH Cart',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      14,
                                    ),
                              ),
                            ),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                DeleteCartEvent(),
                              );
                            },
                            child: const Text(
                              'DELETE Cart',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // Message container at the bottom
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Text(
                        _chooseMessage(state),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
