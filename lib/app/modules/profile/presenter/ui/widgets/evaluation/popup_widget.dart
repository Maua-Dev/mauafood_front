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
class PopUpWidget extends StatelessWidget {

PopUpWidget({super.key, required this.controller});
final PopupStore controller;
final CartController restaurantcontroller = Modular.get();


  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_){
      return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close_rounded),
                        iconSize: 40.0,
                        color: AppColors.mainBlueColor,
                        onPressed:(){
                          controller.togglePopup();
                        }
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurantcontroller.restaurantCart.restaurantName, // contoller cart - Restaurant Name
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.letterColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        "Avalie o restaurante, seu feedback é importante! ",
                        style: TextStyle(
                          fontSize:
                              ScreenHelper.width(context) < 400 ? 16.0 : 24.0,
                          color: AppColors.letterThinColor,
                        ),
                      )),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Image.network(
                          greyLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  StarsWidget(controller: controller) // display StarsWidget - rating stars
                ],
              ),
              actions: [
                Center(
                  child: SizedBox(
                    width: 180,
                    child:ElevatedButton(
                      onPressed: controller.grade == 0 ? null : controller.togglePopup, // Toggle button state based on star selection
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightBlueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "OK",
                        style:
                            TextStyle(color: AppColors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
    }
    );
 
  }
}