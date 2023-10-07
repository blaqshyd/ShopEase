// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/core.dart';

import 'package:shop_ease/features/home/details/color_picker.dart';
import 'package:shop_ease/features/home/details/product_description.dart';
import 'package:shop_ease/features/home/details/store_profile.dart';
import 'package:shop_ease/features/product/data/model/product_model.dart';

import 'call_to_action.dart';
import 'details_header.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              12.h.sbH,
              SizedBox(
                width: double.infinity,
                height: 286.h,
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  cacheHeight: 300,
                  cacheWidth: 300,
                ),
              ),
              12.h.sbH,
              DetailsHeader(product: product),
              16.h.sbH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose the color', style: AppTextStyle.b2Regular),
                  12.h.sbH,
                  //color picker
                  const ColorPicker(),
                  4.h.sbH,
                  const Divider(color: Colors.grey, thickness: 0.15),
                  //store profile
                  const StoreProfile(),
                  4.h.sbH,
                  const Divider(color: Colors.grey, thickness: 0.15),
                  12.h.sbH,
                  ProductDescription(product: product),
                  //buttons
                  const CallToAction(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
