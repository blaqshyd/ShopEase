import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/core/di/locators.dart';
import 'package:shop_ease/core/logger.dart';
import 'package:shop_ease/features/home/domain/model/product_model.dart';
import 'package:shop_ease/features/home/domain/repository/product_repository.dart';
import 'package:shop_ease/services/network_service.dart';

final productRepository = Provider((ref) => ProductRepositoryImpl());

class ProductRepositoryImpl implements ProductRepository {
  var network = locator<Api>();
  var log = locator<Logger>();



  @override
  Future<ApiResponse<List<Product>>> getProducts() async {
    var path = 'https://fakestoreapi.com/products';
    final res = await network.getReq(
      path: path,
      useBaseUrl: false,
    );
    try {
      final List<dynamic> response = res.data;
      final product = response.map((e) => Product.fromJson(e)).toList();
      print(product);
      return ApiResponse(data: product, status: true);
    } catch (e) {
      // log.logger(e.toString());
    }
    return const ApiResponse(err: 'Error Occured', status: false);
  }
}
