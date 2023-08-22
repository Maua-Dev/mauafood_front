import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/pages/employee_menu_page.dart';
import 'package:mauafood_front/app/shared/domain/usecases/create_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/delete_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/update_product_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/upload_photo_to_s3_usecase.dart';
import 'package:mauafood_front/app/shared/domain/usecases/upload_product_photo_usecase.dart';

import '../../shared/domain/enums/restaurant_enum.dart';
import '../../shared/datasource/external/http/menu_datasource.dart';
import '../../shared/domain/repositories/menu_repository_interface.dart';
import '../../shared/domain/usecases/get_restaurant_product_usecase.dart';
import '../../shared/infra/datasource/external/http/menu_datasource_interface.dart';
import '../../shared/infra/repositories/menu_repository.dart';

class EmployeeMenuModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<IGetRestaurantProductUsecase>(
            (i) => GetRestaurantProductUsecase(repository: i())),
        Bind<EmployeeMenuRestaurantController>(
          (i) => EmployeeMenuRestaurantController(
              i(), RestaurantEnum.cantina_do_moleza, i(), i()),
        ),
        Bind.factory<ProductFormController>(
          (i) => ProductFormController(i(), i(), i(), i(), i()),
        ),
        Bind<ICreateProductUsecase>(
            (i) => CreateProductUsecase(repository: i())),
        Bind<IUpdateProductUsecase>(
            (i) => UpdateProductUsecase(repository: i())),
        Bind<IDeleteProductUsecase>(
            (i) => DeleteProductUsecase(repository: i())),
        Bind<IUploadProductPhotoUsecase>(
            (i) => UploadProductPhotoUsecase(repository: i())),
        Bind<IUploadPhotoToS3Usecase>(
            (i) => UploadPhotoToS3Usecase(repository: i())),
        Bind<IMenuRepository>((i) => MenuRepository(datasource: i())),
        Bind<IMenuDatasource>((i) => MenuDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const EmployeeMenuPage(
              restaurant: RestaurantEnum.cantina_do_moleza),
        )
      ];
}
