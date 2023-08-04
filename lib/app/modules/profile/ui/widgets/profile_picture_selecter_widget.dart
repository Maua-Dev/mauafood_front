import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class ProfilePictureSelectorWidget extends StatelessWidget {
  const ProfilePictureSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor2,
      content: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: SizedBox(
          height: ScreenHelper.height(context) * 0.35,
          width: ScreenHelper.width(context),
          child: GridView.count(
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            crossAxisCount: 2,
            children: const <Widget>[
              CircleAvatar(
                radius: 24, // Image radius
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
              CircleAvatar(
                radius: 24, // Image radius
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
              CircleAvatar(
                radius: 24, // Image radius
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
              CircleAvatar(
                radius: 32, // Image radius
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.mainBlueColor),
              child: Center(
                  child: Text(
                "Selecionar",
                style:
                    TextStyle(color: AppColors.backgroundColor2, fontSize: 16),
              )),
            ),
          ),
        )
      ],
    );
  }
}
