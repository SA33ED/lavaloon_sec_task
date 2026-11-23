import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common.dart';
import '../theme/app_theme.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({super.key, required this.text});
  final String text;

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String displayText = isExpanded
        ? widget.text
        : widget.text.length > 200
        ? '${widget.text.substring(0, 150)}...'
        : widget.text;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: RichText(
        textAlign: getIsArabic(widget.text) ? TextAlign.right : TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
              text: displayText,
              style: CustomTextStyle.font400sized12.copyWith(
                fontFamily: getFontName(
                  language: getIsArabic(widget.text) ? "ar" : "en",
                ),
                color: AppColors.grey,
              ),
            ),
            if (widget.text.length > 200)
              TextSpan(
                text: isExpanded
                    ? " ${AppStrings.readLess.tr}"
                    : " ${AppStrings.readMore.tr}",
                style: CustomTextStyle.font500sized14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
