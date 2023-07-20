import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/landing/presenter/navbar/navbar_widget.dart';
import 'package:mauafood_front/app/modules/landing/presenter/controllers/landing_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingController store = Modular.get();
  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/landing/restaurants/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
          child: NavBarWidget(controller: store,)),
      body: const RouterOutlet(),
    );
  }
}
