import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'custom_loading_indicator.dart';
import 'view_images.dart';

class PersonNetworkImage extends StatelessWidget {
  const PersonNetworkImage({
    super.key,
    required this.url,
    required this.height,
  });

  final String url;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height.r),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            barrierColor: AppColors.black.withOpacity(.85),
            builder: (context) => ViewImages(photos: ([url]), index: 0),
          );
        },
        child: CachedNetworkImage(
          imageUrl: url,
          height: height,
          width: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => CustomLoadingIndicator(height: height),
          errorListener: (v) {},
        ),
      ),
    );
  }
}
