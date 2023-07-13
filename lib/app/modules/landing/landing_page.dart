import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/navbar_controller.dart';
import 'navbar_widget.dart';

// ignore: must_be_immutable
class LandingPage extends StatelessWidget {
 LandingPage({super.key});

  
var navbarController = Modular.get<NavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        bottomNavigationBar:  SafeArea(
          child: NavBarWidget(navbarController: navbarController)),
      body: RouterOutlet(),
    );
  }
}