import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauafood_front/app/modules/cart/domain/entities/cart_item_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddItemEvent>(_onAddItem);
    on<DeleteItemEvent>(_onDeleteItem);
    on<UpdateItemEvent>(_onUpdateItem);
  }

  FutureOr<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) {
    emit(CartLoadedState(cartItems: event.cartItems));
  }

  FutureOr<void> _onAddItem(AddItemEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      emit(CartLoadedState(
          cartItems: List.from(state.cartItems)..add(event.item)));
    }
  }

  FutureOr<void> _onDeleteItem(DeleteItemEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      List<CartItem> list = state.cartItems
          .where((item) => item.meal.id != event.item.meal.id)
          .toList();
      emit(CartLoadedState(cartItems: list));
    }
  }

  FutureOr<void> _onUpdateItem(UpdateItemEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      List<CartItem> list = state.cartItems
          .map((e) => e.meal.id == event.item.meal.id ? event.item : e)
          .toList();
      emit(CartLoadedState(cartItems: list));
    }
  }
}
