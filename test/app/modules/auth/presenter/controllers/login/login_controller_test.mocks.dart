// Mocks generated by Mockito 5.3.2 from annotations
// in mauafood_front/test/app/modules/auth/presenter/controllers/login/login_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mauafood_front/app/modules/auth/domain/errors/auth_errors.dart'
    as _i5;
import 'package:mauafood_front/app/modules/auth/domain/infra/auth_storage_interface.dart'
    as _i7;
import 'package:mauafood_front/app/modules/auth/domain/usecases/get_user_attributes.dart'
    as _i8;
import 'package:mauafood_front/app/modules/auth/domain/usecases/login_user.dart'
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

/// A class which mocks [LoginUserInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUserInterface extends _i1.Mock
    implements _i3.LoginUserInterface {
  MockLoginUserInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.SignUpError, _i6.CognitoAuthSession>> call(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
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
            #call,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.SignUpError, _i6.CognitoAuthSession>>);
}

/// A class which mocks [AuthStorageInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthStorageInterface extends _i1.Mock
    implements _i7.AuthStorageInterface {
  MockAuthStorageInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> saveRefreshToken(String? refreshToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [refreshToken],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveAccessToken(String? accessToken) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [accessToken],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveRole(String? role) => (super.noSuchMethod(
        Invocation.method(
          #saveRole,
          [role],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveIdToken(String? idToken) => (super.noSuchMethod(
        Invocation.method(
          #saveIdToken,
          [idToken],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> getRole() => (super.noSuchMethod(
        Invocation.method(
          #getRole,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<String> getIdToken() => (super.noSuchMethod(
        Invocation.method(
          #getIdToken,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<void> cleanSecureStorage() => (super.noSuchMethod(
        Invocation.method(
          #cleanSecureStorage,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [GetUserAttributesInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserAttributesInterface extends _i1.Mock
    implements _i8.GetUserAttributesInterface {
  MockGetUserAttributesInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.GetUserAttributesError,
          List<_i6.AuthUserAttribute>>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<
            _i2.Either<_i5.GetUserAttributesError,
                List<_i6.AuthUserAttribute>>>.value(_FakeEither_0<
            _i5.GetUserAttributesError, List<_i6.AuthUserAttribute>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i4.Future<
          _i2.Either<_i5.GetUserAttributesError, List<_i6.AuthUserAttribute>>>);
}
