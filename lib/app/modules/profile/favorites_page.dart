import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Favoritos", style: TextStyle(fontSize: 20, color: Colors.black),),
        leading: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 8),
            child: Container(width: 50, color: AppColors.mainBlueColor, child: IconButton(
              alignment: Alignment.topLeft,
              onPressed:  () => Modular.to.navigate('/user/'), icon: Icon(FontAwesomeIcons.arrowLeft, color: AppColors.white,))),
          )),
      ),
      backgroundColor: AppColors.backgroundColor2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Container(height: 50, width: 75, color: AppColors.mainBlueColor), const Column(children: [Text("Macarronada"), Text("Restaurante do H")]), Icon(FontAwesomeIcons.solidHeart, color: AppColors.mainBlueColor,)],)
          ],
        ),
      ),
    );
  }
}