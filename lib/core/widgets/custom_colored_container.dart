import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomColoredContainer extends StatelessWidget {
  const CustomColoredContainer({
    super.key,
    this.child,
    this.color,
    this.borderColor,
    this.width,
    this.padding,
  });
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColors.backgroundColor,
        border: Border.all(color: borderColor ?? AppColors.backgroundColor),

        borderRadius: BorderRadius.circular(16.r),
      ),
      child: child,
    );
  }
}
