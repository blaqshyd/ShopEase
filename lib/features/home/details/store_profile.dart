// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:river_state/common/common.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({
    super.key,
  });

  @override
  State<StoreProfile> createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              //radius: 50.r,
              backgroundImage: AssetImage(
                'assets/images/Rectangle 16.png',
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Apple Store', style: AppTextStyle.b1Bold),
                Text('online 12 mins ago', style: AppTextStyle.captionMedium),
              ],
            )
          ],
        ),
        GestureDetector(
          child: Container(
            width: 100.w,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: clicked == true ? Color(0xff67C4A7) : Colors.grey,
                width: 1.w,
              ),
              color: clicked == true ? Color(0xff67C4A7) : Colors.white,
            ),
            child: Text(
              clicked == true ? 'Following' : 'Follow',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: clicked == true ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            setState(() {
              clicked = !clicked;
            });
          },
        ),
      ],
    );
  }
}
