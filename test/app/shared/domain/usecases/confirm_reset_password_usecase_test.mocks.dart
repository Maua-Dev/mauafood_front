// Mocks generated by Mockito 5.4.0 from annotations
// in mauafood_front/test/app/shared/domain/usecases/confirm_reset_password_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/shared/domain/entities/user.dart' as _i6;
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart'
    as _i3;
import 'package:mauafood_front/app/shared/helpers/errors/auth_errors.dart'
    as _i5;
import 'package:mauafood_front/app/shared/infra/models/user_model.dart' as _i7;
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

/// A class which mocks [IAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthRepository extends _i1.Mock implements _i3.IAuthRepository {
  MockIAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, _i6.User>> registerUser(
          _i7.UserModel? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, _i6.User>>.value(
            _FakeEither_0<_i5.AuthErrors, _i6.User>(
          this,
          Invocation.method(
            #registerUser,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, _i8.CognitoAuthSession>> loginUser(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.AuthErrors, _i8.CognitoAuthSession>>.value(
            _FakeEither_0<_i5.AuthErrors, _i8.CognitoAuthSession>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, _i8.CognitoAuthSession>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, void>> confirmEmail(
    String? email,
    String? confirmationCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmEmail,
          [
            email,
            confirmationCode,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, void>>.value(
            _FakeEither_0<_i5.AuthErrors, void>(
          this,
          Invocation.method(
            #confirmEmail,
            [
              email,
              confirmationCode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, void>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, void>> logoutUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #logoutUser,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, void>>.value(
            _FakeEither_0<_i5.AuthErrors, void>(
          this,
          Invocation.method(
            #logoutUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, void>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, void>> forgotPassword(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [email],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, void>>.value(
            _FakeEither_0<_i5.AuthErrors, void>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, void>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, void>> confirmResetPassword(
    String? email,
    String? newPassword,
    String? confirmationCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmResetPassword,
          [
            email,
            newPassword,
            confirmationCode,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, void>>.value(
            _FakeEither_0<_i5.AuthErrors, void>(
          this,
          Invocation.method(
            #confirmResetPassword,
            [
              email,
              newPassword,
              confirmationCode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, void>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, void>> postResendCode(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #postResendCode,
          [email],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.AuthErrors, void>>.value(
            _FakeEither_0<_i5.AuthErrors, void>(
          this,
          Invocation.method(
            #postResendCode,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.AuthErrors, void>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthErrors, List<_i8.AuthUserAttribute>>>
      getUserAttributes() => (super.noSuchMethod(
            Invocation.method(
              #getUserAttributes,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.AuthErrors,
                        List<_i8.AuthUserAttribute>>>.value(
                _FakeEither_0<_i5.AuthErrors, List<_i8.AuthUserAttribute>>(
              this,
              Invocation.method(
                #getUserAttributes,
                [],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.AuthErrors, List<_i8.AuthUserAttribute>>>);
}