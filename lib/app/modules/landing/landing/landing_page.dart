import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/landing/landing_controller.dart';

import '../../../shared/helpers/utils/screen_helper.dart';
import '../../../shared/themes/app_colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingController store = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Modular.to.navigate('/landing/restaurants');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(
            left: ScreenHelper.width(context) * 0.05,
            right: ScreenHelper.width(context) * 0.05,
            bottom: 16),
        decoration: BoxDecoration(
            color: AppColors.mainBlueColor,
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Observer(builder: (context) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: store.index == 0 ? Colors.white : Colors.grey,
                      icon: Icon(Icons.home),
                      onPressed: () {
                        store.selectIndex(0);
                        Modular.to.navigate('/landing/restaurants');
                      },
                    ),
                    IconButton(
                      color: store.index == 1 ? Colors.white : Colors.grey,
                      icon: Icon(Icons.shopping_cart_outlined),
                      onPressed: () {
                        store.selectIndex(1);
                        Modular.to.navigate('/landing/cart');
                      },
                    ),
                    IconButton(
                      color: store.index == 2 ? Colors.white : Colors.grey,
                      icon: Icon(Icons.person_2_outlined),
                      onPressed: () => Modular.to.navigate('/landing/profile'),
                    ),
                    IconButton(
                      color: store.index == 3 ? Colors.white : Colors.grey,
                      icon: Icon(Icons.question_mark_outlined),
                      onPressed: () => Modular.to.navigate('/landing/faq'),
                    ),
                  ]);
            })),
      )),
      body: const RouterOutlet(),
    );
  }
}
