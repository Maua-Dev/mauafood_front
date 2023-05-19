// Mocks generated by Mockito 5.3.2 from annotations
// in mauafood_front/test/app/modules/auth/presenter/controllers/register/register_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/shared/domain/usecases/register_user_usecase.dart'
    as _i3;
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart'
    as _i5;
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

/// A class which mocks [IRegisterUserUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockIRegisterUserUsecase extends _i1.Mock
    implements _i3.IRegisterUserUsecase {
  MockIRegisterUserUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.RegisterError, bool>> call(
    String? fullName,
    String? cpf,
    bool? isStudent,
    String? email,
    String? password,
    bool? emailNotifications,
    bool? appNotifications,
    bool? acceptTerms,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            fullName,
            cpf,
            isStudent,
            email,
            password,
            emailNotifications,
            appNotifications,
            acceptTerms,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.RegisterError, bool>>.value(
            _FakeEither_0<_i5.RegisterError, bool>(
          this,
          Invocation.method(
            #call,
            [
              fullName,
              cpf,
              isStudent,
              email,
              password,
              emailNotifications,
              appNotifications,
              acceptTerms,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.RegisterError, bool>>);
}
