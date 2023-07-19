import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/landing/landing/presenter/controllers/landing_controller.dart';
import 'package:mauafood_front/app/modules/landing/landing/presenter/ui/pages/profile_page.dart';
import 'package:mauafood_front/app/modules/menu/user_menu_module.dart';
import '../../../shared/datasource/external/http/contact_datasource.dart';
import '../../../shared/domain/repositories/contact_repository_interface.dart';
import '../../../shared/domain/usecases/contact_usecase.dart';
import '../../../shared/infra/datasource/external/http/contact_datasource_interface.dart';
import '../../../shared/infra/repositories/contact_repository.dart';
import '../../menu/presenter/controllers/contact/contact_controller.dart';
import 'presenter/ui/pages/landing_page.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LandingController()),
    Bind<IContactUsecase>((i) => ContactUsecase(i())),
        Bind<IContactRepository>((i) => ContactRepository(datasource: i())),
        Bind<IContactDatasource>((i) => ContactDatasource()),
        Bind<ContactController>(
          (i) => ContactController(i()),
        ),
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
          ChildRoute('/faq',
              child: (_, args) => const FaqPage()),
          ChildRoute('/profile',
              child: (_, args) => Center(
                    child: Text('profile'),
                  ))
        ],
        transition: TransitionType.fadeIn),
  ];
}
