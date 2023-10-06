// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:river_state/common/common.dart';

import 'package:river_state/features/product/data/model/product_model.dart';

class DetailsHeader extends StatefulWidget {
  const DetailsHeader({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<DetailsHeader> createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.product.title, style: AppTextStyle.h5Medium),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10.w,
                children: [
                  Text('\$${widget.product.price}', style: AppTextStyle.h3Bold),
                  Text(
                    '( ${widget.product.rating.count} people bought this )',
                    style: AppTextStyle.b2Bold,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 46.h,
          width: 46.h,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  tapped = !tapped;
                });
              },
              child: Icon(
                IconlyBold.heart,
                size: 32,
                color: tapped == true ? Colors.red : Colors.grey,
              )),
        )
      ],
    );
  }
}
