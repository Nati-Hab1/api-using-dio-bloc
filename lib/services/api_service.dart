import 'package:dio/dio.dart';
import 'package:api_using_dio_bloc/models/cart.dart';

class ApiService {
  static const String baseUrl =
      "https://dummyjson.com/carts";
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<List<Cart>> getCarts() async {
    try {
      final response = await dio.get("/");

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            response.data['carts'];
        return jsonData
            .map((cart) => Cart.fromJson(cart))
            .toList();
      } else {
        throw Exception('Failed to load carts');
      }
    } on DioException catch (e) {
      throw Exception(
        'Error while getting all carts: ${e.message}',
      );
    }
  }

  static Future<Cart> getCart(int id) async {
    try {
      final response = await dio.get("/$id");

      if (response.statusCode == 200) {
        return Cart.fromJson(response.data);
      } else {
        throw Exception("Failed to load a single cart");
      }
    } on DioException catch (e) {
      throw Exception(
        'Error while getting a single cart: ${e.message}',
      );
    }
  }

  static Future<Cart> createCart(
    List<Map<String, dynamic>> products,
  ) async {
    try {
      final response = await dio.post(
        "/add",
        data: {'userId': 1, 'products': products},
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        return Cart.fromJson(response.data);
      } else {
        throw Exception("Failed to create cart");
      }
    } on DioException catch (e) {
      throw Exception(
        "Error while creating a cart: ${e.message}",
      );
    }
  }
}
