part of 'demand_bloc.dart';

abstract class DemandEvent extends Equatable {
  const DemandEvent();

  @override
  List<Object> get props => [];
}

class LoadEvent extends DemandEvent {
  final CartItem item;

  const LoadEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class AddQuantityEvent extends DemandEvent {
  final CartItem item;

  const AddQuantityEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class RemoveQuantityEvent extends DemandEvent {
  final CartItem item;

  const RemoveQuantityEvent({required this.item});

  @override
  List<Object> get props => [item];
}
