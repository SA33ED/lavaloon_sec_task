import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

void showImagePickerBottomSheet(
  BuildContext context,
  Function(XFile) onImagePicked,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    builder: (context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            AppStrings.uploadPhoto.tr,
            style: CustomTextStyle.font600sized16,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImagePickerOption(
                context,
                icon: Icons.camera_alt,
                label: AppStrings.camera.tr,
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(context, onImagePicked, ImageSource.camera);
                },
              ),
              _buildImagePickerOption(
                context,
                icon: Icons.photo_library,
                label: AppStrings.gallery.tr,
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(context, onImagePicked, ImageSource.gallery);
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}

Widget _buildImagePickerOption(
  BuildContext context, {
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 30.sp),
          SizedBox(height: 8.h),
          Text(
            label,
            style: CustomTextStyle.font400sized12.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> _pickImage(
  BuildContext context,
  Function(XFile) onImagePicked,
  ImageSource source,
) async {
  try {
    if (source == ImageSource.camera) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        onImagePicked(image);
      }
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        onImagePicked(image);
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("خطأ في اختيار الصورة"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
