import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/features/home/data/repository/product_repository.dart';

final productProvider = FutureProvider.autoDispose<ApiResponse>((ref) async {
  final product = await ref.watch(productRepository).getProducts();
  return product;
});
