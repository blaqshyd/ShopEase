import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:river_state/common/app_colors.dart';
import 'package:river_state/core/data.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

int selectedColor = 0;

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          category.length,
          (index) {
            return GestureDetector(
              child: Container(
                width: 61.w,
                height: 41.h,
                decoration: BoxDecoration(
                  border: selectedColor == index
                      ? Border.all(color: Colors.red)
                      : Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8.r),
                  // color: productColor[index],
                  color: AppColor.dGreenLightHover,
                ),
              ),
              onTap: () {
                setState(
                  () {
                    selectedColor = index;
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
