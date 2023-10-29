import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../../shared/helpers/enums/http_status_code_enum.dart';
import '../../../../../../shared/helpers/errors/errors.dart';
import '../../../../../../shared/helpers/functions/get_http_status_function.dart';
import '../../../../../../shared/infra/models/cart_product_model.dart';
import '../datasource/cart_datasource_interface.dart';
import 'cart_repository_interface.dart';

class CartRepository extends ICartRepository {
  final ICartDatasource datasource;
  String orderId = "";

  CartRepository({required this.datasource});

  @override
  Future<Either<Failure, String>> createOrder(
      List<CartProductModel> productList, RestaurantEnum restaurant) async {
    try {
      orderId = await datasource.createOrder(productList, restaurant);
      return Right(orderId);
    } on DioError catch (e) {
      HttpStatusCodeEnum errorType = getHttpStatusFunction(
          e.response?.statusCode ?? HttpStatus.badRequest);
      return Left(ErrorRequest(message: errorType.errorMessage));
    }
  }
}
