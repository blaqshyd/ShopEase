import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/features/product/data/model/product_model.dart';
import 'package:shop_ease/features/product/data/repository/product_repository.dart';

final productProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  final product = await ref.watch(productRepository).getProducts();
  return product;
});
