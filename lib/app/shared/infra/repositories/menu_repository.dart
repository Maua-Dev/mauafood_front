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
  Future<Either<Failure, void>> getAllProducts() async {
    if (jsonAllRestaurants.isNotEmpty) return right(null);
    try {
      jsonAllRestaurants = await datasource.getAllProducts();
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
      //caso erro venha do back
      //return left(ErrorRequest(message: e.response?.data));
    }
    return right(null);
  }

  @override
  Future<Either<Failure, List<Product>>> getBibaProducts() async {
    List<Product>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['SOUZA_DE_ABREU']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'SOUZA_DE_ABREU'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }

  @override
  Future<Either<Failure, List<Product>>> getHoraHProducts() async {
    List<Product>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts = ProductModel.fromMaps(jsonAllRestaurants['HORA_H']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'HORA_H'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }

  @override
  Future<Either<Failure, List<Product>>> getMolezaProducts() async {
    List<Product>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts =
          ProductModel.fromMaps(jsonAllRestaurants['CANTINA_DO_MOLEZA']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'CANTINA_DO_MOLEZA'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }
}