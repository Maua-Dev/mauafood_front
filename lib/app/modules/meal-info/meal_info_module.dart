import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/bloc/demand_bloc.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/meal_info_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class MealInfoModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.lazySingleton((i) => DemandBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) =>
              MealInfoPage(mealInfo: args.data[0], bloc: args.data[1]),
        ),
      ];
}
