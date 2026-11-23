import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';

abstract class CustomTextStyle {
  static String get fontFamily => getFontName();

  static TextStyle get font900sized22 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w900,
    fontSize: 22.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font400sized14 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font400sized12 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font400sized16 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font400sized18 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font500sized18 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font600sized16 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font500sized16 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font500sized24 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font500sized14 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font500sized12 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font300sized12 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font700sized18 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font700sized12 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font300sized14 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get font300sized10 => TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 10.sp,
    overflow: TextOverflow.ellipsis,
  );
}
