import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/generated/l10n.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantEnum restaurantInfo;

  const RestaurantWidget({
    Key? key,
    required this.restaurantInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () =>
            Modular.to.pushNamed('/user/menu', arguments: restaurantInfo),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                SizedBox(
                  width: ScreenHelper.width(context) / 3.5,
                  height: ScreenHelper.width(context) / 3.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            restaurantImages[restaurantInfo.restaurantImg]!),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        width: ScreenHelper.width(context) * 0.4,
                        child: Text(
                          restaurantInfo.restaurantName,
                          style: AppTextStyles.h1.copyWith(
                              fontSize:
                                  ScreenHelper.width(context) < 550 ? 19 : 28,
                              color: AppColors.mainBlueColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.width(context) * 0.4,
                      child: Text(
                        S.of(context).seeMenuTitle,
                        style: AppTextStyles.h2.copyWith(
                            fontSize: 16, color: AppColors.mainBlueColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
