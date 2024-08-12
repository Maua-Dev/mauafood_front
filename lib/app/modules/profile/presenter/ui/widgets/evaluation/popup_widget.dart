import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/widgets/evaluation/stars_widget.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/cart/cart_controller.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

// ignore: must_be_immutable
class PopUpWidget extends StatefulWidget {
  PopUpWidget({super.key, required this.controller});
  final PopupStore controller;

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> {
  final CartController restaurantcontroller = Modular.get();

  @override
  void initState() {
    widget.controller.setRestaurantName(restaurantcontroller.restaurantCart);
    restaurantcontroller.resetRestaurantName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        content: SizedBox(
          width: 350,
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    iconSize: 40.0,
                    color: AppColors.mainBlueColor,
                    onPressed: () {
                      widget.controller
                          .togglePopup(); // Redirects user to profile page
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.controller.restaurantName.name.isEmpty
                        ? "Nome do Restaurante"
                        : widget.controller.restaurantName
                            .name, // contoller cart - Restaurant Name
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: AppColors.letterColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  child: Text(
                    "Avalie o restaurante, seu feedback é importante! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenHelper.width(context) < 400 ? 16.0 : 20.0,
                      color: AppColors.letterThinColor,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 50,
                    child: Image.network(
                      greyLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              StarsWidget(
                  controller:
                      widget.controller) // display StarsWidget - rating stars
            ],
          ),
        ),
        actions: [
          Center(
            child: SizedBox(
              width: 180,
              child: ElevatedButton(
                onPressed: widget.controller.grade == 0
                    ? null
                    : () => {
                          widget.controller.togglePopup(),
                          widget.controller.sendFeedback(
                              restaurantcontroller.id,
                              widget.controller.restaurantName,
                              context),
                          restaurantcontroller.resetRestaurantName()
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(color: AppColors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
    });
  }
}
