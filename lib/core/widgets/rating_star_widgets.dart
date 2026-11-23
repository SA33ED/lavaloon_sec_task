import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final int maxRating;

  const RatingStars({super.key, this.rating = 4, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        maxRating,
        (index) {
          return Icon(
            Icons.star,
            color: index < rating ? Colors.amber : AppColors.lightGrey,
            size: 20,
          );
        },
      ),
    );
  }
}
