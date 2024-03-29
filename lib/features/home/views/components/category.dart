import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/common/common.dart';
import 'package:shop_ease/core/core.dart';
import 'package:shop_ease/core/data.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
            category.length,
            (index) => Column(
                  children: [
                    ClipRRect(
                      borderRadius: AppSizing.borderRadius,
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        color: category[index][2],
                        child: Image.asset(
                          category[index][0],
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    4.sbH,
                    Text(
                      category[index][1],
                      style: AppTextStyle.b2Medium.copyWith(
                        color: AppColor.black10,
                      ),
                    ),
                  ],
                )),
      ],
    );
  }
}
