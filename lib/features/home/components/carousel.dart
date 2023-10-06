import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:river_state/common/common.dart';
import 'package:river_state/core/data.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => AppSizing.w04,
        scrollDirection: Axis.horizontal,
        itemCount: banner.length,
        itemBuilder: (context, index) => Image.asset(banner[index]),
      ),
    );
  }
}
