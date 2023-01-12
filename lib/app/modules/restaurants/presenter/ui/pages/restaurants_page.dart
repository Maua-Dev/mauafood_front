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
        backgroundColor: AppColors.letterHighlightThinColor,
        appBar: AppBar(
          title: Text(
            S.of(context).appTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, size: 40),
                onPressed: () {},
              ),
            )
          ],
          backgroundColor: AppColors.letterHighlightThinColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColor2,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).restaurantsTitle,
                    style: AppTextStyles.h1,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.4,
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
