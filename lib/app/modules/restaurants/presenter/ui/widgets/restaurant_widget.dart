import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/utils/utils.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../../shared/widgets/circular_progress_indicator_custom_widget.dart';

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
                  width: Utils.width(context) / 3.5,
                  height: Utils.width(context) / 3.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                        restaurantImages[restaurantInfo.restaurantImg]!,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CircularProgressIndicatorCustomWidget(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                      child: Text(
                        restaurantInfo.name,
                        style: AppTextStyles.h1.copyWith(
                            fontSize: 19, color: AppColors.mainBlueColor),
                      ),
                    ),
                    Text(
                      S.of(context).seeMenuTitle,
                      style: AppTextStyles.h2.copyWith(
                          fontSize: 16, color: AppColors.mainBlueColor),
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
