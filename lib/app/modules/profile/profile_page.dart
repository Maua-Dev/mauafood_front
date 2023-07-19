import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      body: Column(
        children: [SizedBox(height: ScreenHelper.height(context)*0.2),
        Container(height: ScreenHelper.height(context)*0.8,
        width: ScreenHelper.width(context),
         decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 64.0, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Daniel Capuzzo", style: TextStyle(
                fontSize: 20,
                color: AppColors.mainBlueColor,
                fontWeight: FontWeight.bold
              ),),
             
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [IconButton(onPressed:() 
              {
                 Modular.to.navigate('/favorites');}, icon: Icon(FontAwesomeIcons.solidHeart, size: 12, color: AppColors.mainBlueColor,))  , const Text("Favoritos"), SizedBox(width: ScreenHelper.width(context)*0.5,), Icon(Icons.arrow_right_sharp, color: AppColors.mainBlueColor,)],
            )
          ],),
        ),
        )],
      )
    );
  }
}
