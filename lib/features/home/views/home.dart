import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/common/loader.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/features/home/providers/product_provider.dart';
import 'package:shop_ease/features/home/views/components/custom_field.dart';
// import 'package:shop_ease/services/local_storage.dart';
import 'components/app_bar.dart';

import 'components/carousel.dart';
import 'components/category.dart';
import 'components/product_filter.dart';
import 'components/product_grid_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 128,
            collapsedHeight: 128,
            flexibleSpace: Column(
              children: [
                const CustomAppBar(),
                AppSizing.h16,
                const CustomField(),
              ],
            ),
          ),
          SliverPersistentHeader(
            delegate: MyCarousel(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Carousel(),
                    Text(
                      'Category',
                      style: AppTextStyle.h5Medium,
                    ),
                    8.sbH,
                    const Category(),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: Padding(
          padding: AppSizing.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent product',
                    style: AppTextStyle.h5Medium,
                  ),
                  const FilterProduct(),
                ],
              ),
              AppSizing.h12,
              Consumer(
                builder: (context, ref, child) {
                  final products = ref.watch(productProvider);
                  return products.when(
                    data: (product) {
                      return ProductGridList(
                        products: product.data,
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text('Error: $error'),
                    ),
                    loading: () => const Loader(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCarousel extends SliverPersistentHeaderDelegate {
  final Widget child;
  MyCarousel(this.child);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: AppColor.background, child: child);
  }

  @override
  double get maxExtent => 280.h;

  @override
  double get minExtent => 280.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
