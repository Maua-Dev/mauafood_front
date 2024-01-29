// Mocks generated by Mockito 5.4.2 from annotations
// in mauafood_front/test/app/modules/employee/presenter/controllers/product-form/product_form_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:flutter/material.dart' as _i8;
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart'
    as _i5;
import 'package:mauafood_front/app/modules/employee/presenter/states/employee_menu_state.dart'
    as _i2;
import 'package:mauafood_front/app/modules/employee/presenter/states/product-card/product_card_employee_state.dart'
    as _i3;
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart'
    as _i9;
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart'
    as _i6;
import 'package:mauafood_front/app/shared/infra/models/product_model.dart'
    as _i7;
import 'package:mobx/mobx.dart' as _i4;
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

class _FakeEmployeeMenuState_0 extends _i1.SmartFake
    implements _i2.EmployeeMenuState {
  _FakeEmployeeMenuState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductCardEmployeeState_1 extends _i1.SmartFake
    implements _i3.ProductCardEmployeeState {
  _FakeProductCardEmployeeState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeReactiveContext_2 extends _i1.SmartFake
    implements _i4.ReactiveContext {
  _FakeReactiveContext_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EmployeeMenuRestaurantController].
///
/// See the documentation for Mockito's code generation for more information.
class MockEmployeeMenuRestaurantController extends _i1.Mock
    implements _i5.EmployeeMenuRestaurantController {
  @override
  _i6.RestaurantEnum get restaurantInfo => (super.noSuchMethod(
        Invocation.getter(#restaurantInfo),
        returnValue: _i6.RestaurantEnum.none,
        returnValueForMissingStub: _i6.RestaurantEnum.none,
      ) as _i6.RestaurantEnum);
  @override
  set restaurantInfo(_i6.RestaurantEnum? _restaurantInfo) => super.noSuchMethod(
        Invocation.setter(
          #restaurantInfo,
          _restaurantInfo,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.EmployeeMenuState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeEmployeeMenuState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeEmployeeMenuState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.EmployeeMenuState);
  @override
  set state(_i2.EmployeeMenuState? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.ProductCardEmployeeState get productCardState => (super.noSuchMethod(
        Invocation.getter(#productCardState),
        returnValue: _FakeProductCardEmployeeState_1(
          this,
          Invocation.getter(#productCardState),
        ),
        returnValueForMissingStub: _FakeProductCardEmployeeState_1(
          this,
          Invocation.getter(#productCardState),
        ),
      ) as _i3.ProductCardEmployeeState);
  @override
  set productCardState(_i3.ProductCardEmployeeState? value) =>
      super.noSuchMethod(
        Invocation.setter(
          #productCardState,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i7.ProductModel> get listAllProduct => (super.noSuchMethod(
        Invocation.getter(#listAllProduct),
        returnValue: <_i7.ProductModel>[],
        returnValueForMissingStub: <_i7.ProductModel>[],
      ) as List<_i7.ProductModel>);
  @override
  set listAllProduct(List<_i7.ProductModel>? value) => super.noSuchMethod(
        Invocation.setter(
          #listAllProduct,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i7.ProductModel> get listAllProductWithoutAccent => (super.noSuchMethod(
        Invocation.getter(#listAllProductWithoutAccent),
        returnValue: <_i7.ProductModel>[],
        returnValueForMissingStub: <_i7.ProductModel>[],
      ) as List<_i7.ProductModel>);
  @override
  set listAllProductWithoutAccent(List<_i7.ProductModel>? value) =>
      super.noSuchMethod(
        Invocation.setter(
          #listAllProductWithoutAccent,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isMaxPriceSearch => (super.noSuchMethod(
        Invocation.getter(#isMaxPriceSearch),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isMaxPriceSearch(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isMaxPriceSearch,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isMinPriceSearch => (super.noSuchMethod(
        Invocation.getter(#isMinPriceSearch),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isMinPriceSearch(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isMinPriceSearch,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set rangeValues(_i8.RangeValues? value) => super.noSuchMethod(
        Invocation.setter(
          #rangeValues,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get search => (super.noSuchMethod(
        Invocation.getter(#search),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set search(String? value) => super.noSuchMethod(
        Invocation.setter(
          #search,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get index => (super.noSuchMethod(
        Invocation.getter(#index),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set index(int? value) => super.noSuchMethod(
        Invocation.setter(
          #index,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i9.ProductEnum get productType => (super.noSuchMethod(
        Invocation.getter(#productType),
        returnValue: _i9.ProductEnum.ALL,
        returnValueForMissingStub: _i9.ProductEnum.ALL,
      ) as _i9.ProductEnum);
  @override
  set productType(_i9.ProductEnum? value) => super.noSuchMethod(
        Invocation.setter(
          #productType,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isUserMenu => (super.noSuchMethod(
        Invocation.getter(#isUserMenu),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set isUserMenu(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #isUserMenu,
          value,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_2(
          this,
          Invocation.getter(#context),
        ),
        returnValueForMissingStub: _FakeReactiveContext_2(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ReactiveContext);
  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setIsMaxPriceSearch(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setIsMaxPriceSearch,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setIsMinPriceSearch(bool? value) => super.noSuchMethod(
        Invocation.method(
          #setIsMinPriceSearch,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setRangeValues(_i8.RangeValues? value) => super.noSuchMethod(
        Invocation.method(
          #setRangeValues,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setIndex(int? value) => super.noSuchMethod(
        Invocation.method(
          #setIndex,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setProductType(_i9.ProductEnum? value) => super.noSuchMethod(
        Invocation.method(
          #setProductType,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void changeState(_i2.EmployeeMenuState? value) => super.noSuchMethod(
        Invocation.method(
          #changeState,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void changeProductCardState(_i3.ProductCardEmployeeState? value) =>
      super.noSuchMethod(
        Invocation.method(
          #changeProductCardState,
          [value],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<void> loadRestaurantMenu() => (super.noSuchMethod(
        Invocation.method(
          #loadRestaurantMenu,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  void filterProduct() => super.noSuchMethod(
        Invocation.method(
          #filterProduct,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void cleanFilter() => super.noSuchMethod(
        Invocation.method(
          #cleanFilter,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<void> deleteProduct(
    _i6.RestaurantEnum? restaurant,
    String? id,
    int? index,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [
            restaurant,
            id,
            index,
          ],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}
