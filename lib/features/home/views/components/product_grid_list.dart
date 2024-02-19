// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/features/home/domain/model/product_model.dart';
import 'package:shop_ease/features/home/views/details/details.dart';
import 'package:shop_ease/services/cache_image.dart';

class ProductGridList extends StatelessWidget {
  const ProductGridList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 10.r,
            childAspectRatio: 1 / 1,
            mainAxisExtent: 217.w,
            //? for the width
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () => AppRouter.push(Details(product: product)),
              child: SizedBox(
                child: Column(
                  children: [
                    //! Product Image
                    Expanded(
                      flex: 3,
                      child: CacheNetwork.image(product.image),
                    ),
                    AppSizing.h04,
                    //! Product Description
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration().curvedRadius(
                          color: AppColor.black5.withOpacity(.8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.r, vertical: 8.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppTextStyle.b2Bold,
                              ),
                              4.sbH,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${product.price}',
                                    style: AppTextStyle.captionBold.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyBold.star,
                                        size: 18,
                                        color: AppColor.yellowNormal,
                                      ),
                                      Text(
                                        '${product.rating.rate}',
                                        style:
                                            AppTextStyle.captionBold.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
