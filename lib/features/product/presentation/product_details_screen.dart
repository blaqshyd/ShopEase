// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:river_state/core/core.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.productTitle,
    required this.productPrice,
    required this.productDesc,
  }) : super(key: key);
  final String imageUrl;
  final String productTitle;
  final String productPrice;
  final String productDesc;

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
                  image: DecorationImage(image: NetworkImage(imageUrl))),
            ),
            32.sbH,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  12.sbH,
                  Text(
                    '\$ $productPrice',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 24),
                  ),
                  16.sbH,
                  Text(
                    productDesc,
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
