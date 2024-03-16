class CartProduct {
  final String id;
  final double price;
  final String name;
  final String observation;
  final int quantity;
  final String photo;

  CartProduct(
      {required this.price,
      required this.name,
      required this.id,
      required this.observation,
      required this.quantity,
      required this.photo});
}
