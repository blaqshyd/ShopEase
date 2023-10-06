import 'package:flutter/material.dart';
import 'package:river_state/common/common.dart';
import 'package:river_state/core/core.dart';
import 'package:river_state/features/product/data/model/product_model.dart';
import 'package:river_state/features/product/presentation/product_details_screen.dart';

class ProductGridList extends StatelessWidget {
  const ProductGridList({
    required this.data,
    super.key,
  });

  final List<Product> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 260,
        childAspectRatio: 1,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final product = data[index];
        return GestureDetector(
          onTap: () => AppRouter.push(
            ProductDetailsScreen(product: product),
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: AppSizing.borderRadius * 1,
                color: AppColor.black5,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    height: 160,
                    decoration: BoxDecoration(
                        color: AppColor.background,
                        image: DecorationImage(
                          image: NetworkImage(product.image),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        4.sbH,
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        6.sbH,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 23),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColor.yellowNormal,
                                ),
                                Text(
                                  '${product.rating.rate}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
