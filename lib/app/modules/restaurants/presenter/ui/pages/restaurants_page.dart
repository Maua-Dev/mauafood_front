import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../../shared/themes/app_text_styles.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RestaurantController>();

    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: true,
          title: SizedBox(
            child: Image.asset(
              'assets/images/logos/white_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: AppColors.mainBlueColor,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
              )),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).restaurantsTitle,
                  style:
                      AppTextStyles.h1.copyWith(color: AppColors.mainBlueColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.restaurants.length,
                    itemBuilder: (context, i) {
                      return RestaurantWidget(
                        restaurantInfo:
                            controller.restaurants[i].restaurantInfo,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
