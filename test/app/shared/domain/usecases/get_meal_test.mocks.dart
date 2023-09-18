// Mocks generated by Mockito 5.4.2 from annotations
// in mauafood_front/test/app/shared/domain/usecases/get_meal_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i8;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart'
    as _i7;
import 'package:mauafood_front/app/shared/domain/repositories/menu_repository_interface.dart'
    as _i3;
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart' as _i5;
import 'package:mauafood_front/app/shared/infra/models/product_model.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IMenuRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMenuRepository extends _i1.Mock implements _i3.IMenuRepository {
  MockIMenuRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>
      getBibaProducts() => (super.noSuchMethod(
            Invocation.method(
              #getBibaProducts,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ProductModel>>(
              this,
              Invocation.method(
                #getBibaProducts,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>
      getHoraHProducts() => (super.noSuchMethod(
            Invocation.method(
              #getHoraHProducts,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ProductModel>>(
              this,
              Invocation.method(
                #getHoraHProducts,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>
      getMolezaProducts() => (super.noSuchMethod(
            Invocation.method(
              #getMolezaProducts,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.ProductModel>>(
              this,
              Invocation.method(
                #getMolezaProducts,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.ProductModel>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>> createProduct(
    _i6.ProductModel? product,
    _i7.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [
            product,
            restaurant,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProductModel>(
          this,
          Invocation.method(
            #createProduct,
            [
              product,
              restaurant,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>> updateProduct(
    _i6.ProductModel? product,
    _i7.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [
            product,
            restaurant,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>>.value(
                _FakeEither_0<_i5.Failure, _i6.ProductModel>(
          this,
          Invocation.method(
            #updateProduct,
            [
              product,
              restaurant,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.ProductModel>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> deleteProduct(
    String? id,
    _i7.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [
            id,
            restaurant,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #deleteProduct,
            [
              id,
              restaurant,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> uploadProductPhoto(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadProductPhoto,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #uploadProductPhoto,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> uploadPhotoToS3(
    String? url,
    _i8.Uint8List? photo,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPhotoToS3,
          [
            url,
            photo,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #uploadPhotoToS3,
            [
              url,
              photo,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}
