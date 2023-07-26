import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/modules/profile/controllers/profile_controller.dart';
import 'package:mauafood_front/app/modules/profile/ui/widgets/profile_options_widget.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController store = Modular.get();
  final icons = [
    Icon(
      FontAwesomeIcons.solidHeart,
      size: 22,
      color: AppColors.mainBlueColor,
    ),
    Icon(
      FontAwesomeIcons.solidBell,
      size: 22,
      color: AppColors.mainBlueColor,
    ),
    Icon(
      FontAwesomeIcons.solidAddressCard,
      size: 22,
      color: AppColors.mainBlueColor,
    ),
    Icon(
      FontAwesomeIcons.brazilianRealSign,
      size: 22,
      color: AppColors.mainBlueColor,
    ),
  ];

  final texts = [
    const Text(
      "Favoritos",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Notificações",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Meus dados",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      "Pagamentos",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ];

  final routes = [
    "favorites/",
    "favorites/",
    "favorites/",
    "favorites/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        body: Column(
          children: [
            SizedBox(height: ScreenHelper.height(context) * 0.1),
            Container(
              height: ScreenHelper.height(context) * 0.9,
              width: ScreenHelper.width(context),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor2,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 48),
                      child: Text(
                        store.name,
                        style: TextStyle(
                            fontSize: 32,
                            color: AppColors.mainBlueColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                      itemCount: texts.length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ProfileOptionsWidget(
                          icon: icons[index],
                          route: routes[index],
                          text: texts[index],
                        );
                      },
                    ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
