part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  final List<CartItemModel> cartItems;

  const LoadCartEvent({this.cartItems = const <CartItemModel>[]});

  @override
  List<Object> get props => [cartItems];
}

class AddItemEvent extends CartEvent {
  final CartItemModel item;

  const AddItemEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class UpdateItemEvent extends CartEvent {
  final CartItemModel item;

  const UpdateItemEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends CartEvent {
  final String id;

  const DeleteItemEvent({required this.id});

  @override
  List<Object> get props => [id];
}
