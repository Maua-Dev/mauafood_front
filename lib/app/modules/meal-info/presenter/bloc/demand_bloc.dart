import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/infra/models/cart_item_model.dart';
part 'demand_event.dart';
part 'demand_state.dart';

class DemandBloc extends Bloc<DemandEvent, DemandState> {
  DemandBloc() : super(DemandInitialState()) {
    on<AddQuantityEvent>(_addQuantity);
    on<RemoveQuantityEvent>(_removeQuantity);
    on<LoadEvent>(_load);
  }

  FutureOr<void> _addQuantity(
      AddQuantityEvent event, Emitter<DemandState> emit) {
    emit(DemandLoadingState());
    CartItemModel item = event.item;
    if (event.item.quantity >= 0) {
      item = CartItemModel(
          meal: event.item.meal, quantity: event.item.quantity + 1);
    }
    emit(DemandLoadedState(item: item));
  }

  FutureOr<void> _removeQuantity(
      RemoveQuantityEvent event, Emitter<DemandState> emit) {
    emit(DemandLoadingState());
    CartItemModel item = event.item;
    if (event.item.quantity > 0) {
      item = CartItemModel(
          meal: event.item.meal, quantity: event.item.quantity - 1);
    }
    emit(DemandLoadedState(item: item));
  }

  FutureOr<void> _load(LoadEvent event, Emitter<DemandState> emit) {
    emit(DemandLoadedState(item: event.item));
  }
}
