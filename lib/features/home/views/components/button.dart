import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DButton extends StatelessWidget {
  const DButton({
    super.key,
    required this.text,
    required this.color, required this.textColor,
  });

  final String text;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 167.w,
        height: 45.h,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: textColor),
          ),
        ),
      ),
    );
  }
}