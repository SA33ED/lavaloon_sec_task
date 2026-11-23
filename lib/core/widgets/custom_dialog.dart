import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';
import 'custom_elevated_button.dart';

Future<void> showCustomSuccessDialog({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CustomSuccessDialog(title: title, description: description);
    },
  );
}

Future<void> showCustomConfirmationDialog({
  required BuildContext context,
  required Widget icon,
  required String title,
  required String description,
  required VoidCallback onConfirm,
  String? confirmText,
  String? cancelText,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CustomConfirmationDialog(
        icon: icon,
        title: title,
        description: description,
        confirmText: confirmText ?? AppStrings.confirm.tr,
        cancelText: cancelText ?? AppStrings.cancel.tr,
        onConfirm: onConfirm,
      );
    },
  );
}

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 90.r,
            width: 90.r,
            decoration: BoxDecoration(
              color: AppColors.lightGreen.withOpacity(.22),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                height: 66.r,
                width: 66.r,
                decoration: const BoxDecoration(
                  color: Color(0xFF47D37A),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: AppColors.white, size: 32.sp),
              ),
            ),
          ),
          SizedBox(height: 54.h),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: CustomTextStyle.font500sized18.copyWith(
              color: AppColors.secondaryColor,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            description,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: CustomTextStyle.font400sized14.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomConfirmationDialog extends StatelessWidget {
  const CustomConfirmationDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
  });

  final Widget icon;
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: 36.h),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: CustomTextStyle.font500sized18.copyWith(
              color: AppColors.secondaryColor,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            description,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: CustomTextStyle.font400sized14.copyWith(
              color: AppColors.grey,
              height: 1.35,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: cancelText,
                  color: AppColors.transparent,
                  borderColor: AppColors.primary,
                  textColor: AppColors.primary,
                  borderRadius: 14.r,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomElevatedButton(
                  text: confirmText,
                  borderRadius: 14.r,
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DialogShell extends StatelessWidget {
  const _DialogShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 22.w),
      backgroundColor: AppColors.transparent,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(26.w, 42.h, 26.w, 32.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE2E2E2).withOpacity(0.9),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.22),
              blurRadius: 28.r,
              offset: Offset(0, 14.h),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
