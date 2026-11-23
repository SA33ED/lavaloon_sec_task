import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.text,
    this.width,
    this.color,
    this.borderColor,
    this.textColor,
    this.onPressed,
    this.icon,
    this.elevation,
    this.borderRadius,
    this.contentPadding,
    this.style,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Color? textColor;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final Color? borderColor;
  final double? elevation;
  final Widget? icon;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          elevation: elevation ?? 0,
          shadowColor: AppColors.lightGrey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
            side: BorderSide(
              color: onPressed != null
                  ? (borderColor ?? AppColors.primary)
                  : Colors.transparent,
            ),
          ),
        ),
        child: Padding(
          padding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text != null)
                Flexible(
                  child: Text(
                    text!,
                    style:
                        style ??
                        CustomTextStyle.font500sized14.copyWith(
                          color: textColor ?? AppColors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),

              if (icon != null && text != null) SizedBox(width: 8.w),

              ?icon,
            ],
          ),
        ),
      ),
    );
  }
}
