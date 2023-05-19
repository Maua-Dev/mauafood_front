// Mocks generated by Mockito 5.3.2 from annotations
// in mauafood_front/test/app/modules/auth/domain/usecases/confirm_email_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/shared/domain/errors/auth_errors.dart'
    as _i5;
import 'package:mauafood_front/app/shared/domain/repositories/auth_repository_interface.dart'
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

/// A class which mocks [AuthRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepositoryInterface extends _i1.Mock
    implements _i3.AuthRepositoryInterface {
  MockAuthRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.RegisterError, bool>> registerUser(dynamic user) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.RegisterError, bool>>.value(
            _FakeEither_0<_i5.RegisterError, bool>(
          this,
          Invocation.method(
            #registerUser,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.RegisterError, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.SignUpError, _i6.CognitoAuthSession>> loginUser(
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
                _i2.Either<_i5.SignUpError, _i6.CognitoAuthSession>>.value(
            _FakeEither_0<_i5.SignUpError, _i6.CognitoAuthSession>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.SignUpError, _i6.CognitoAuthSession>>);
  @override
  _i4.Future<_i2.Either<_i5.ConfirmationEmailError, bool>> confirmEmail(
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
        returnValue:
            _i4.Future<_i2.Either<_i5.ConfirmationEmailError, bool>>.value(
                _FakeEither_0<_i5.ConfirmationEmailError, bool>(
          this,
          Invocation.method(
            #confirmEmail,
            [
              email,
              confirmationCode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ConfirmationEmailError, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.LogoutError, void>> logoutUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #logoutUser,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.LogoutError, void>>.value(
            _FakeEither_0<_i5.LogoutError, void>(
          this,
          Invocation.method(
            #logoutUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.LogoutError, void>>);
  @override
  _i4.Future<_i2.Either<_i5.ForgotPasswordError, bool>> forgotPassword(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [email],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.ForgotPasswordError, bool>>.value(
                _FakeEither_0<_i5.ForgotPasswordError, bool>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ForgotPasswordError, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.ForgotPasswordError, void>> confirmResetPassword(
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
        returnValue:
            _i4.Future<_i2.Either<_i5.ForgotPasswordError, void>>.value(
                _FakeEither_0<_i5.ForgotPasswordError, void>(
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
      ) as _i4.Future<_i2.Either<_i5.ForgotPasswordError, void>>);
  @override
  _i4.Future<_i2.Either<_i5.ResendCodeError, void>> postResendCode(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #postResendCode,
          [email],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.ResendCodeError, void>>.value(
            _FakeEither_0<_i5.ResendCodeError, void>(
          this,
          Invocation.method(
            #postResendCode,
            [email],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.ResendCodeError, void>>);
  @override
  _i4.Future<
      _i2.Either<_i5.GetUserAttributesError,
          List<_i6.AuthUserAttribute>>> getUserAttributes() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserAttributes,
          [],
        ),
        returnValue: _i4.Future<
            _i2.Either<_i5.GetUserAttributesError,
                List<_i6.AuthUserAttribute>>>.value(_FakeEither_0<
            _i5.GetUserAttributesError, List<_i6.AuthUserAttribute>>(
          this,
          Invocation.method(
            #getUserAttributes,
            [],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.GetUserAttributesError, List<_i6.AuthUserAttribute>>>);
}
