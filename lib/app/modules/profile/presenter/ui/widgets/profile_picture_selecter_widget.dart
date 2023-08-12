import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../../../generated/l10n.dart';
import '../../controllers/profile_controller.dart';

class ProfilePictureSelectorWidget extends StatelessWidget {
  const ProfilePictureSelectorWidget({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    controller.tempPhotoIndex = controller.photoIndex;

    return AlertDialog(
      backgroundColor: AppColors.backgroundColor2,
      insetPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.all(8),
      content: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Observer(builder: (_) {
            return SizedBox(
              height: ScreenHelper.height(context) > 700
                  ? ScreenHelper.height(context) * 0.45
                  : ScreenHelper.height(context) * 0.6,
              width: ScreenHelper.width(context),
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 24, // Image radius
                          backgroundImage: NetworkImage(profilePictureCoxinha),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 24, // Image radius
                          backgroundImage: NetworkImage(profilePictureSoda),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 24, // Image radius
                          backgroundImage: NetworkImage(profilePicturePotato),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 24, // Image radius
                          backgroundImage:
                              NetworkImage(profilePictureHamburguer),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      }),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                controller.setPhotoIndex().then((value) {
                  if (controller.successful) {
                    GlobalSnackBar.success(
                        S.of(context).profileSuccessPictureMessage);
                  } else {
                    GlobalSnackBar.error(
                        S.of(context).profileErrorPictureMessage);
                  }
                  Modular.to.pop();
                });
              },
              child: Container(
                height: 50,
                width: ScreenHelper.width(context) * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.mainBlueColor),
                child: Center(
                    child: Text(
                  S.of(context).selectButton,
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
