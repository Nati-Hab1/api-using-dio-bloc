import 'package:api_using_dio_bloc/blocs/cart/cart_bloc.dart';
import 'package:api_using_dio_bloc/screens/carts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CartBloc()),
        ],
        child: CartsScreen(),
      ),
    );
  }
}
