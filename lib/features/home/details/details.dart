// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_ease/common/common.dart';

import 'package:shop_ease/features/product/data/model/product_model.dart';

import 'body.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => AppRouter.pop(),
          child: ImageIcon(
            AssetImage('assets/icons/Arrow - Left.png'),
            color: Colors.black,
          ),
        ),
        title: Text(
          'Details product',
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/icons/Buy.png'),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Body(product: product),
    );
  }
}
