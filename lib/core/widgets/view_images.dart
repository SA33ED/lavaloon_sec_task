import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class ViewImages extends StatefulWidget {
  const ViewImages({
    super.key,
    required this.index,
    required this.photos,
  });

  final int index;
  final List<String> photos;

  @override
  State<ViewImages> createState() => _ViewImagesState();
}

class _ViewImagesState extends State<ViewImages> {
  late final PageController _controller;
  int currentIndex = 0;

  static const int _kLoopFactor = 1000;

  bool get hasMultipleImages => widget.photos.length > 1;

  int get initialPage => hasMultipleImages
      ? widget.photos.length * _kLoopFactor + widget.index
      : 0;

  @override
  void initState() {
    super.initState();

    if (hasMultipleImages) {
      _controller = PageController(initialPage: initialPage);
      currentIndex = widget.index;
    }
  }

  int _getRealIndex(int page) {
    return page % widget.photos.length;
  }

  @override
  void dispose() {
    if (hasMultipleImages) {
      _controller.dispose();
    }
    super.dispose();
  }

  Widget _buildZoomableImage(String url) {
    return InteractiveViewer(
      minScale: 1,
      maxScale: 4,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        errorWidget: (context, error, stackTrace) => Center(
          child: Icon(
            Icons.error,
            color: AppColors.grey,
            size: 50.h,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.photos.isEmpty) {
      return const Center(
        child: Icon(
          Icons.image_not_supported,
          color: AppColors.grey,
          size: 64,
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                radius: 14.h,
                backgroundColor: AppColors.white,
                child: const Icon(
                  Icons.close,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 36.h),
        Expanded(
          child: Stack(
            children: [
              if (!hasMultipleImages)
                Center(
                  child: _buildZoomableImage(widget.photos.first),
                )
              else
                PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = _getRealIndex(value);
                    });
                  },
                  itemBuilder: (context, index) {
                    final realIndex = _getRealIndex(index);
                    return _buildZoomableImage(
                      widget.photos[realIndex],
                    );
                  },
                ),
              if (hasMultipleImages)
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: GestureDetector(
                          onTap: () => _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.white.withOpacity(.5),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: GestureDetector(
                          onTap: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.white.withOpacity(.5),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (hasMultipleImages)
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Wrap(
              spacing: 4.w,
              children: List.generate(
                widget.photos.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentIndex == index ? 24.w : 8.h,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.primary
                          : AppColors.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                },
              ),
            ),
          ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
