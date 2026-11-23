import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';
import 'custom_elevated_button.dart';

class NetworkErrorAlertDialog extends StatelessWidget {
  const NetworkErrorAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(26.r),
          ),
          child: Column(
            spacing: 8.h,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.wifi_off_outlined,
                color: AppColors.black,
                size: 64,
              ),
              //! Title
              Text(
                AppStrings.noInternetConnection.tr,
                style: CustomTextStyle.font500sized16,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
              //! Subtitle
              Text(
                AppStrings.pleaseCheckYourInternetConnectionAndTryAgain.tr,
                style: CustomTextStyle.font400sized12,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              //! Try Again Button
              CustomElevatedButton(
                onPressed: () => Navigator.pop(context),
                text: AppStrings.tryAgain.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
