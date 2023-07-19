import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import '../../restaurants/restaurant_module.dart';
import './landing_controller.dart';
import './landing_page.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LandingController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => const LandingPage(),
        children: [
          ModuleRoute('/restaurants', module: UserMenuModule()),
          ChildRoute('/cart',
              child: (_, args) => Center(
                    child: Text('carrinho'),
                  )),
          ChildRoute('/profile',
              child: (_, args) => Center(
                    child: Text('profile'),
                  )),
          ChildRoute('/faq',
              child: (_, args) => Center(
                    child: Text('faq'),
                  ))
        ],
        transition: TransitionType.fadeIn),
  ];
}
