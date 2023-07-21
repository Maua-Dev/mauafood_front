import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenHelper.height(context) * 0.15),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainBlueColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: IconButton(
                        onPressed: () =>
                            Modular.to.navigate('/landing/profile/'),
                        icon: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: AppColors.white,
                          size: 23,
                        ))),
                SizedBox(
                  width: ScreenHelper.width(context) * 0.24,
                ),
                const SizedBox(
                  child: Text(
                    "Favoritos",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: AppColors.backgroundColor2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: ScreenHelper.width(context) * 0.45,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Macarronada",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "Restaurante do H",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 32,
                        color: AppColors.mainBlueColor,
                      ),
                    ],
                  ),
                ));
          },
          itemCount: 15,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
