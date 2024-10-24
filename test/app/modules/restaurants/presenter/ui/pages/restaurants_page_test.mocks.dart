// Mocks generated by Mockito 5.4.4 from annotations
// in mauafood_front/test/app/modules/restaurants/presenter/ui/pages/restaurants_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mauafood_front/app/modules/restaurants/presenter/controllers/restaurant_controller.dart'
    as _i3;
import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart'
    as _i4;
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIGetRestaurant_0 extends _i1.SmartFake
    implements _i2.IGetRestaurant {
  _FakeIGetRestaurant_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RestaurantController].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestaurantController extends _i1.Mock
    implements _i3.RestaurantController {
  MockRestaurantController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IGetRestaurant get getRestaurant => (super.noSuchMethod(
        Invocation.getter(#getRestaurant),
        returnValue: _FakeIGetRestaurant_0(
          this,
          Invocation.getter(#getRestaurant),
        ),
      ) as _i2.IGetRestaurant);

  @override
  List<_i4.Restaurant> get restaurants => (super.noSuchMethod(
        Invocation.getter(#restaurants),
        returnValue: <_i4.Restaurant>[],
      ) as List<_i4.Restaurant>);

  @override
  set restaurants(List<_i4.Restaurant>? _restaurants) => super.noSuchMethod(
        Invocation.setter(
          #restaurants,
          _restaurants,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLogged => (super.noSuchMethod(
        Invocation.getter(#isLogged),
        returnValue: false,
      ) as bool);

  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void getRestaurants() => super.noSuchMethod(
        Invocation.method(
          #getRestaurants,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
