import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../shared/themes/app_text_styles.dart';
import '../../domain/infra/restaurant_enum.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RestaurantController>();

    return Scaffold(
        backgroundColor: AppColors.letterHighlightThinColor,
        appBar: AppBar(
          title: const Text(
            "Mauá Food",
            style: TextStyle(
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
                    'Restaurantes',
                    style: AppTextStyles.h1,
                  ),
                ),
                SizedBox(
                  height: (200.0 * controller.restaurants.length), //talvez tenha macacada aqui, uga
                  child: ListView.builder(
                    itemCount: controller.restaurants.length,
                    itemBuilder: (context, i) {
                      return RestaurantWidget(                     // os widgets esão tortos um em relação ao outro
                          name: controller.restaurants[i].restaurantInfo.name,
                          photoLink: controller
                              .restaurants[i].restaurantInfo.restaurantImg);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
