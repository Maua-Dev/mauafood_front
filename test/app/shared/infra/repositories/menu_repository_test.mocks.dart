// Mocks generated by Mockito 5.4.2 from annotations
// in mauafood_front/test/app/shared/infra/repositories/menu_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i6;

import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart'
    as _i5;
import 'package:mauafood_front/app/shared/infra/datasource/external/http/menu_datasource_interface.dart'
    as _i3;
import 'package:mauafood_front/app/shared/infra/models/product_model.dart'
    as _i2;
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

class _FakeProductModel_0 extends _i1.SmartFake implements _i2.ProductModel {
  _FakeProductModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IMenuDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIMenuDatasource extends _i1.Mock implements _i3.IMenuDatasource {
  MockIMenuDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<Map<String, dynamic>> getAllProducts() => (super.noSuchMethod(
        Invocation.method(
          #getAllProducts,
          [],
        ),
        returnValue:
            _i4.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i4.Future<Map<String, dynamic>>);
  @override
  _i4.Future<_i2.ProductModel> createProduct(
    _i2.ProductModel? product,
    _i5.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [
            product,
            restaurant,
          ],
        ),
        returnValue: _i4.Future<_i2.ProductModel>.value(_FakeProductModel_0(
          this,
          Invocation.method(
            #createProduct,
            [
              product,
              restaurant,
            ],
          ),
        )),
      ) as _i4.Future<_i2.ProductModel>);
  @override
  _i4.Future<_i2.ProductModel> updateProduct(
    _i2.ProductModel? product,
    _i5.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [
            product,
            restaurant,
          ],
        ),
        returnValue: _i4.Future<_i2.ProductModel>.value(_FakeProductModel_0(
          this,
          Invocation.method(
            #updateProduct,
            [
              product,
              restaurant,
            ],
          ),
        )),
      ) as _i4.Future<_i2.ProductModel>);
  @override
  _i4.Future<void> deleteProduct(
    String? id,
    _i5.RestaurantEnum? restaurant,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [
            id,
            restaurant,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> uploadProductPhoto(String? id) => (super.noSuchMethod(
        Invocation.method(
          #uploadProductPhoto,
          [id],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<void> uploadPhotoToS3(
    String? url,
    _i6.Uint8ClampedList? photo,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadPhotoToS3,
          [
            url,
            photo,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
