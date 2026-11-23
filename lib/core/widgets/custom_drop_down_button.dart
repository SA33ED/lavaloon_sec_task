import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.labelStyle,
    this.validator,
    required this.value,
    this.enabled = true,
  });

  final String label;
  final TextStyle? labelStyle;
  final List<DropdownMenuItem<dynamic>>? items;
  final Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final dynamic value;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      hint: Text(
        label,
        style: CustomTextStyle.font400sized12.copyWith(color: Colors.white),
      ),
      borderRadius: BorderRadius.circular(8),
      items: items,
      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
      onChanged: enabled ? onChanged : null,
      dropdownColor: AppColors.fillColor,
      validator: validator,
      decoration: InputDecoration(
        fillColor: AppColors.fillColor.withOpacity(0.3),
        filled: true,
        border: getBorderStyle(context),
        enabledBorder: getBorderStyle(context),
        focusedBorder: getBorderStyle(context),
        errorBorder: getBorderStyle(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
      isExpanded: true,
    );
  }
}

OutlineInputBorder getBorderStyle(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: BorderSide(
      color: AppColors.fillColor.withOpacity(0.3),
      width: 0.5.w,
    ),
  );
}
