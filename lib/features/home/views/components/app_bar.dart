import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/core.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.sbH,
              Text(
                'Delivery Address',
                style: AppTextStyle.b2Medium,
              ),
              AppSizing.h04,
              Wrap(
                spacing: 4,
                children: [
                  Text(
                    'Salatiga City, Central Java',
                    style: AppTextStyle.b1Medium,
                  ),
                  const Icon(
                    IconlyLight.arrow_down_2,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(IconlyLight.buy),
        12.sbW,
        const Icon(IconlyLight.notification),
        12.sbW,
      ],
    );
  }
}
