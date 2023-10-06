import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:my_formfield/my_formfield.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MyFormField(
        contentPadding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 8.r,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFFF0F2F1),
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(IconlyLight.search),
        inputHint: 'Search here ...',
      ),
    );
  }
}
