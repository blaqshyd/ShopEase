// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/features/product/data/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.sbH,
            Container(
              height: MediaQuery.sizeOf(context).height * .3,
              decoration: BoxDecoration(
                  // color: AppColor.background,
                  image: DecorationImage(image: NetworkImage(product.image))),
            ),
            32.sbH,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  12.sbH,
                  Text(
                    '\$ ${product.price}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  16.sbH,
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
