import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/product_model.dart';
import '../../helpers/enums/http_status_code_enum.dart';
import '../../helpers/functions/get_http_status_function.dart';
import '../datasource/external/http/menu_datasource_interface.dart';

class MenuRepository implements IMenuRepository {
  final IMenuDatasource datasource;
  Map<String, dynamic> _jsonAllRestaurants = {};

  MenuRepository({required this.datasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllProducts() async {
    if (_jsonAllRestaurants.isNotEmpty) return right(_jsonAllRestaurants);
    try {
      _jsonAllRestaurants = await datasource.getAllProducts();
      return right(_jsonAllRestaurants);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getBibaProducts() async {
    List<ProductModel>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts =
          ProductModel.fromMaps(_jsonAllRestaurants['SOUZA_DE_ABREU']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'SOUZA_DE_ABREU'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getHoraHProducts() async {
    List<ProductModel>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts = ProductModel.fromMaps(_jsonAllRestaurants['HORA_H']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'HORA_H'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getMolezaProducts() async {
    List<ProductModel>? restaurantProducts;
    var result = await getAllProducts();

    return result.fold((l) {
      return left(l);
    }, (r) {
      restaurantProducts =
          ProductModel.fromMaps(_jsonAllRestaurants['CANTINA_DO_MOLEZA']);
      return restaurantProducts == null
          ? left(NoItemsFound(message: 'CANTINA_DO_MOLEZA'))
          : restaurantProducts!.isEmpty
              ? left(EmptyList())
              : right(restaurantProducts!);
    });
  }

  @override
  Future<Either<Failure, ProductModel>> createProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    try {
      var response = await datasource.createProduct(product, restaurant);
      return right(response);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(
      String id, RestaurantEnum restaurant) async {
    try {
      await datasource.deleteProduct(id, restaurant);
      return right(null);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(
      ProductModel product, RestaurantEnum restaurant) async {
    try {
      var response = await datasource.updateProduct(product, restaurant);
      return right(response);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType =
          getHttpStatusFunction(e.response!.statusCode);
      return left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
