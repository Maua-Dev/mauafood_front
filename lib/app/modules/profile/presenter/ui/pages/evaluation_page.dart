import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart";
import 'package:mauafood_front/app/modules/profile/presenter/ui/widgets/evaluation/stars_widget.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/cart/cart_controller.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EvaluationPopup(),
      backgroundColor: AppColors.mainBlueColor,
    );
  }
}

class EvaluationPopup extends StatefulWidget {
  const EvaluationPopup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EvaluationPopupState createState() => _EvaluationPopupState();
}

class _EvaluationPopupState extends State<EvaluationPopup> {
  final PopupStore popupStore = PopupStore();
  final CartController controller = Modular.get();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Center(
        child: Observer(builder: (_) {
          if (popupStore.showPopup) {
            return Container(
              color: AppColors.white,
              child: AlertDialog(
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            controller.restaurantCart.restaurantName,
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
                            fontSize: ScreenHelper.width(context) < 400 ? 16.0 : 24.0,
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
            
                    StarsWidget(controller: PopupStore())
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          popupStore.togglePopup();
                        },
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
              ),
            );
          } else {
            return Center(
              child: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                            child: SizedBox(
                              height: 100,
                              child: Image.network(
                                whiteLogo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                         Container(
                          height:519,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(54.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            )
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Obrigado por usar no',style: TextStyle( 
                                    color: AppColors.letterColor,
                                    fontSize: 24.0,
                                  fontWeight:FontWeight.bold
                                  
                                  ),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('MauáFood!',style: TextStyle(
                                  color: AppColors.blueLetterColor, 
                                  fontSize: 24.0,
                                  fontWeight:FontWeight.bold))
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  child: SizedBox(
                                    height: 280,
                                    child: Image.network(
                                      evaluation_background,
                                      fit: BoxFit.contain,
                                    ),
                                ),
                              
                        ),
                            ],
                          ),
            
                      ),
                      
            
                  ],);
                }
              ),
            );
          }
        }),
    );
  }
}
