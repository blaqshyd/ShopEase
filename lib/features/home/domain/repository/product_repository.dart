import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/features/home/domain/model/product_model.dart';

abstract class ProductRepository {
  Future<ApiResponse<List<Product>>> getProducts();
}
