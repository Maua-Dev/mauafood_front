part of 'demand_bloc.dart';

abstract class DemandState extends Equatable {
  const DemandState();

  @override
  List<Object> get props => [];
}

class DemandInitialState extends DemandState {}

class DemandLoadingState extends DemandState {}

class DemandLoadedState extends DemandState {
  final CartItem item;

  const DemandLoadedState({required this.item});

  @override
  List<Object> get props => [item];
}
