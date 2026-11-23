import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

AppBar customAppBar(
  BuildContext context, {
  title,
  onPressed,
  backgroundColor,
  titleColor,
  List<Widget>? actions,
  showBackButton = true,
}) {
  final bool isEn = Localizations.localeOf(context).languageCode == 'en';
  return AppBar(
    title: title != null
        ? Text(
            title,
            style: CustomTextStyle.font500sized14.copyWith(color: titleColor),
          )
        : null,
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppColors.white,
    elevation: 0,
    actions: actions,
    leadingWidth: showBackButton == true ? 60.w : 0,
    leading: showBackButton == true
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: onPressed ?? () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.backgroundFill,
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(isEn ? -1.0 : 1.0, 1.0, 1.0),
                    child: SvgPicture.asset(Assets.imagesSvgBack),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink(),
  );
}
