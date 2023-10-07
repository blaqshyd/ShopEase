// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/features/product/presentation/widgets/button.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          DButton(
            color: Color(0xff67C4A7),
            text: 'Add to Cart',
            textColor: Colors.white,
          ),

          //button 2
          DButton(
            color: Color(0xffD9D9D9),
            text: 'Buy Now',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
