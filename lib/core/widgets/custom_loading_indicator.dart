import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.height,
    this.color,
    this.backgroundColor,
    this.showBackGround = true,
  });
  final double? height;
  final Color? color, backgroundColor;
  final bool showBackGround;
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
    // return Visibility(
    //   visible: showBackGround,
    //   replacement: LoadingAnimationWidget.threeArchedCircle(
    //     color: color ?? AppColors.primary,
    //     size: height ?? 50.h,
    //   ),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: backgroundColor ?? Colors.white,
    //       borderRadius: BorderRadius.circular(12.r),
    //     ),
    //     padding: EdgeInsets.all(16.h),
    //     child: LoadingAnimationWidget.threeArchedCircle(
    //       color: color ?? AppColors.primary,
    //       size: height ?? 50.h,
    //     ),
    //   ),
    // );
  }
}
