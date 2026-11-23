import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_loading_indicator.dart';

class PaginationListView extends StatelessWidget {
  PaginationListView({
    super.key,
    required this.onScrollToEnd,
    required this.hasMore,
    required this.data,
    required this.itemBuilder,
    this.padding = const EdgeInsets.all(0),
  });
  final ScrollController _scrollController = ScrollController();
  final VoidCallback onScrollToEnd;
  final bool hasMore;
  final List data;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    // Listen to scroll events to trigger load more
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        onScrollToEnd();
      }
    });
    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: hasMore ? data.length + 1 : data.length,
      padding: padding,
      itemBuilder: (context, index) {
        if (index == data.length) {
          // Show a loading indicator at the end of the list
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const CustomLoadingIndicator(),
            ),
          );
        }
        return itemBuilder(context, index);
      },
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
    );
  }
}
