import '../enums/product_enum.dart';

class Product {
  final String? id;
  final String name;
  final String? description;
  final double price;
  final String? photo;
  final int? prepareTime;
  final ProductEnum type;
  final bool available;
  final DateTime? lastUpdate;

  const Product({
    this.lastUpdate,
    required this.available,
    required this.photo,
    this.id,
    required this.name,
    required this.description,
    required this.price,
    this.prepareTime,
    required this.type,
  });

  factory Product.newProduct() {
    return const Product(
      available: true,
      photo: '',
      name: '',
      description: '',
      price: 0,
      type: ProductEnum.ALL,
    );
  }
}
