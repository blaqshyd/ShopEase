// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_ease/common/common.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.background,
        child: SpinKitPulse(
          color: AppColor.black10,
          duration: Duration(seconds: 2),
          size: 50.0,
        ),
      ),
    );
  }
}
