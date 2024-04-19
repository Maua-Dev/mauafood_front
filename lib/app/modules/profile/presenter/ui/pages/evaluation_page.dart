import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart";
import 'package:mauafood_front/app/modules/profile/presenter/ui/widgets/evaluation/popup_widget.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EvaluationPopup(),
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
  final PopupStore popupStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Stack(
      children: [
        Center(
          child: Builder(builder: (context) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 8),
                        child: SizedBox(
                          height: 80,
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
                  height: ScreenHelper.height(context) < 700 ? 539 : 804,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(54.0),
                        topRight: Radius.circular(8.0),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Obrigado por usar o',
                            style: TextStyle(
                                color: AppColors.letterColor,
                                fontSize: ScreenHelper.width(context) < 400
                                    ? 24.0
                                    : 32.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('MauáFood!',
                              style: TextStyle(
                                  color: AppColors.blueLetterColor,
                                  fontSize: ScreenHelper.width(context) < 400
                                      ? 24.0
                                      : 32.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: SizedBox(
                          height:
                              ScreenHelper.height(context) < 700 ? 208 : 408,
                          child: Image.network(
                            evaluation_background,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Volte Sempre!',
                              style: TextStyle(
                                  color: AppColors.letterThinColor,
                                  fontSize: ScreenHelper.width(context) < 400
                                      ? 16.0
                                      : 24.0,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          width: ScreenHelper.width(context) < 400 ? 160 : 200,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightBlueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: ScreenHelper.width(context) < 400
                                      ? 16.0
                                      : 24.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: TextButton(
                        onPressed: () {
                          popupStore
                              .togglePopup(); // Sets showPopup variable to true on button click (displays popup)
                        },
                        child: Text(
                          "Avaliar",
                          style: TextStyle(
                            color: AppColors.letterColor,
                            fontSize:
                                ScreenHelper.width(context) < 400 ? 16.0 : 24.0,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
        // Shows widget on "avaliar" button click
        Visibility(
          visible: popupStore.showPopup,
          child: Observer(builder: (_) {
            if (popupStore.showPopup) {
              return PopUpWidget(
                  controller:
                      popupStore); // Checks showPopup  and displays popup widget if true
            } else {
              return const SizedBox
                  .shrink(); // Checks showPopup and doesn't displays popup widget if false
            }
          }),
        ),

        Center(
          child: Observer(builder: (_) {
            return popupStore.showPopup
                ? Container(
                    // Checks showPopup  and displays popup widget if true
                    color: AppColors.white,
                    child: PopUpWidget(controller: popupStore),
                  )
                : const SizedBox
                    .shrink(); // Checks showPopup and doesn't displays popup widget if false
          }),
        ),
      ],
    );
  }
}
