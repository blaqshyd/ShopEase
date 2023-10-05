import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_state/features/product/data/model/product_model.dart';

final productRepository = Provider((ref) => ProductRepository());

class ProductRepository {
  final Dio _dio = Dio();
  Future<List<Product>> getProducts() async {
    final res = await _dio.get('https://fakestoreapi.com/products');
    if (res.statusCode == 200) {
      try {
        final List<dynamic> response = res.data;

        final product = response.map((e) => Product.fromJson(e)).toList();

        return product;
      } catch (e) {
        rethrow;
      }
    }
    throw ApiError();
  }
}

class ApiError {}
