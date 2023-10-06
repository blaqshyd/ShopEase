import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../common/common.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            width: 1.w,
            color: const Color(0xFFF0F2F1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          child: Row(
            children: [
              const Text('Filter'),
              AppSizing.w08,
              Icon(
                IconlyLight.filter_2,
                size: 18.r,
              ),
            ],
          ),
        ));
  }
}
