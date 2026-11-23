import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'app_theme.dart';

ThemeData getDarkAppTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.black),
    scaffoldBackgroundColor: AppColors.black,
    canvasColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      fontFamily: getFontName(),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
        fontFamily: getFontName(),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.black,

      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.black;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.grey;
        }
        return AppColors.white;
      }),

      dayStyle: CustomTextStyle.font700sized18.copyWith(color: AppColors.white),
      yearStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
      ),
      weekdayStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.grey,
      ),

      rangeSelectionOverlayColor: const WidgetStatePropertyAll(AppColors.white),

      headerHelpStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
      ),
      headerHeadlineStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
      ),
      rangePickerHeaderHeadlineStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
      ),
      rangePickerHeaderHelpStyle: CustomTextStyle.font400sized14.copyWith(
        color: AppColors.white,
      ),
    ),
  );
}
