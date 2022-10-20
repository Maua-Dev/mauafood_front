import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/restaurants/restaurants_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: RestaurantModule()),
      ];
}
