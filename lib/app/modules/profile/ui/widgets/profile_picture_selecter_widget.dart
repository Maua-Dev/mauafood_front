import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../controllers/profile_controller.dart';

class ProfilePictureSelectorWidget extends StatelessWidget {
  const ProfilePictureSelectorWidget({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    controller.tempPhotoIndex = controller.photoIndex;

    return AlertDialog(
      backgroundColor: AppColors.backgroundColor2,
      content: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Observer(builder: (_) {
          return SizedBox(
            height: ScreenHelper.height(context) * 0.4,
            width: ScreenHelper.width(context),
            child: GridView.count(
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: () => controller.getTempPhotoIndex(0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.tempPhotoIndex == 0
                            ? AppColors.mainBlueColor
                            : AppColors.backgroundColor2,
                        borderRadius: BorderRadius.circular(120)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 24, // Image radius
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.getTempPhotoIndex(1),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.tempPhotoIndex == 1
                            ? AppColors.mainBlueColor
                            : AppColors.backgroundColor2,
                        borderRadius: BorderRadius.circular(120)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 24, // Image radius
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.getTempPhotoIndex(2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.tempPhotoIndex == 2
                            ? AppColors.mainBlueColor
                            : AppColors.backgroundColor2,
                        borderRadius: BorderRadius.circular(120)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 24, // Image radius
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.getTempPhotoIndex(3),
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.tempPhotoIndex == 3
                            ? AppColors.mainBlueColor
                            : AppColors.backgroundColor2,
                        borderRadius: BorderRadius.circular(120)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 24, // Image radius
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () => {controller.setPhotoIndex(), Navigator.pop(context)},
              child: Container(
                height: 50,
                width: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.mainBlueColor),
                child: Center(
                    child: Text(
                  "Selecionar",
                  style: TextStyle(
                      color: AppColors.backgroundColor2, fontSize: 16),
                )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
