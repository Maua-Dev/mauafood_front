import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/presenter/ui/widgets/navbar/navbar_widget.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: NavBarWidget(
          controller: store,
        ),
      )),
      body: Observer(builder: (context) {
        if (store.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const RouterOutlet();
      }),
    );
  }
}
