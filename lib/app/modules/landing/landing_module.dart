import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/employee_menu_module.dart';
import 'package:mauafood_front/app/modules/landing/presenter/controllers/landing_controller.dart';
import 'package:mauafood_front/app/modules/landing/presenter/ui/pages/landing_page.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/order_status_controller.dart';

import 'package:mauafood_front/app/modules/user/user_menu_module.dart';
import 'package:mauafood_front/app/modules/profile/profile_module.dart';
import 'package:mauafood_front/app/modules/user/user_module.dart';
import 'package:mauafood_front/app/shared/domain/usecases/send_email.dart';
import '../../shared/datasource/external/http/contact_datasource.dart';
import '../../shared/domain/repositories/contact_repository_interface.dart';

import '../../shared/domain/usecases/user_send_email.dart';
import '../../shared/guards/auth_guard.dart';
import '../../shared/helpers/services/s3/assets_s3.dart';
import '../../shared/infra/datasource/external/http/contact_datasource_interface.dart';
import '../../shared/infra/repositories/contact_repository.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/contact/contact_controller.dart';
import 'presenter/ui/pages/faq_page.dart';

class LandingModule extends Module {
  @override
  List<Module> get imports => [UserModule()];
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LandingController(i())),
    Bind<ISendEmail>((i) => SendEmail(i())),
    Bind<IUserSendEmail>((i) => UserSendEmail(i())),
    Bind<IContactRepository>((i) => ContactRepository(datasource: i())),
    Bind<IContactDatasource>((i) => ContactDatasource(i())),
    Bind<ContactController>(
      (i) => ContactController(i(), i(), i()),
    ),
    Bind(
      (i) => OrderStatusController(),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => const LandingPage(),
        children: [
          ModuleRoute('/employee/', module: EmployeeMenuModule()),
          ModuleRoute('/restaurants/', module: UserMenuModule()),
          ChildRoute(
            '/cart/',
            child: (_, args) => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    greyLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Funcionalidade em Construção',
                  style: AppTextStyles.h2,
                ),
              ],
            ),
          ),
          ChildRoute('/faq/', child: (_, args) => const FaqPage()),
          ModuleRoute('/profile/',
              module: ProfileModule(), guards: [AuthGuard()]),
        ],
        transition: TransitionType.fadeIn),
  ];
}
