// Mocks generated by Mockito 5.3.2 from annotations
// in mauafood_front/test/app/modules/menu/domain/usecases/get_product_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/modules/menu/domain/entities/product.dart'
    as _i6;
import 'package:mauafood_front/app/modules/menu/domain/errors/errors.dart'
    as _i5;
import 'package:mauafood_front/app/modules/menu/domain/infra/menu_repository_interface.dart'
    as _i3;
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
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>> getBibaProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBibaProducts,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Product>>(
          this,
          Invocation.method(
            #getBibaProducts,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>> getHoraHProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHoraHProducts,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Product>>(
          this,
          Invocation.method(
            #getHoraHProducts,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>> getMolezaProducts() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMolezaProducts,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Product>>(
          this,
          Invocation.method(
            #getMolezaProducts,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>);
}
