part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  final List<CartItem> cartItems;

  const LoadCartEvent({this.cartItems = const <CartItem>[]});

  @override
  List<Object> get props => [cartItems];
}

class AddItemEvent extends CartEvent {
  final CartItem item;

  const AddItemEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class UpdateItemEvent extends CartEvent {
  final CartItem item;

  const UpdateItemEvent({required this.item});

  @override
  List<Object> get props => [item];
}

class DeleteItemEvent extends CartEvent {
  final CartItem item;

  const DeleteItemEvent({required this.item});

  @override
  List<Object> get props => [item];
}
