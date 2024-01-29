import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../themes/app_colors.dart';

class LikeButtonCustom extends StatelessWidget {
  final bool isFavorite;
  final Future<bool> Function(bool)? onFavoritePressed;
  const LikeButtonCustom(
      {super.key, required this.isFavorite, this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
        isLiked: isFavorite,
        onTap: onFavoritePressed,
        circleColor:
            const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (isLiked) => Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? AppColors.mainBlueColor : Colors.grey,
            ));
  }
}
