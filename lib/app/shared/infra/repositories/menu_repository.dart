import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../datasource/external/http/menu_datasource_interface.dart';

class MenuRepository implements IMenuRepository {
  final IMenuDatasource datasource;
  Map<String, dynamic> jsonAllRestaurants = {};

  MenuRepository({required this.datasource}) {
    getAllProducts();
  }

  @override
  Future<void> getAllProducts() async {
    jsonAllRestaurants = await datasource.getAllProducts();
  }

  @override
  Future<Either<Failure, List<Product>>> getBibaProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();

    try {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['SOUZA_DE_ABREU']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Product>>> getHoraHProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();
    try {
      restaurantProducts = ProductModel.fromMaps(jsonAllRestaurants['HORA_H']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }

    return right(restaurantProducts);
  }

  @override
  Future<Either<Failure, List<Product>>> getMolezaProducts() async {
    List<Product>? restaurantProducts;
    await getAllProducts();
    try {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['CANTINA_DO_MOLEZA']);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }

    return right(restaurantProducts);
  }
}
