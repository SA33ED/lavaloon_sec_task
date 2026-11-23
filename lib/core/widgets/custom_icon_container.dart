import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.backgroundColor,
    this.reverseIcon = false,
  });
  final VoidCallback onPressed;
  final String icon;
  final double? iconSize;
  final Color? backgroundColor;
  final bool reverseIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: backgroundColor ?? AppColors.backgroundFill,
        ),
        child: reverseIcon
            ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(reverseIcon ? -1.0 : 1.0, 1.0, 1.0),
                child: SvgPicture.asset(icon),
              )
            : SvgPicture.asset(icon),
      ),
    );
  }
}
