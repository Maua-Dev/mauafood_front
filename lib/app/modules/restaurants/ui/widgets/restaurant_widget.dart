import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../presenter/controllers/restaurant_controller.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantEnum restaurantInfo;

  final String route;
  const RestaurantWidget({
    Key? key,
    required this.restaurantInfo,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RestaurantController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  restaurantInfo.restaurantImg,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurantInfo.name,
                  style: AppTextStyles.h1,
                ),
              ),
              SizedBox(
                  height: 60,
                  width: 220,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), //a borda nao esta ficando arredondada
                          ),
                          backgroundColor: AppColors.backgroundColor),
                      onPressed: () => Modular.to.navigate(route,
                          arguments:
                              controller.restaurants[i].restaurantInfo.name),
                      child: Text(
                        "Ver cardápio",
                        style: AppTextStyles.h2HighlightBold,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
