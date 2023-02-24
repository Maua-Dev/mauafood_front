import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart';
import 'package:mauafood_front/app/modules/restaurants/presenter/ui/widgets/restaurant_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../../shared/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../dialog/disclaimer_dialog.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DisclaimerDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<RestaurantController>();

    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: true,
          title: SizedBox(
            child: Image.network(
              whiteLogo,
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: AppColors.mainBlueColor,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
              )),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
