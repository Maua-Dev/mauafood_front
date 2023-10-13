import 'package:mauafood_front/app/shared/domain/entities/product.dart';

class ProductViewModel extends Product {
  final bool isFavorite;
  ProductViewModel(
      {required super.id,
      required super.available,
      required super.photo,
      required super.name,
      required super.description,
      required super.price,
      required super.type,
      this.isFavorite = false});

  static List<ProductViewModel> fromListProduct(List<Product> items) {
    return items
        .map((e) => ProductViewModel(
            id: e.id,
            available: e.available,
            description: e.description,
            name: e.name,
            photo: e.photo,
            price: e.price,
            type: e.type))
        .toList();
  }

  static List<ProductViewModel> fromListProductWithFavorite(
      List<Product> items, List<String> favorites) {
    return items
        .map((e) => ProductViewModel(
            id: e.id,
            available: e.available,
            description: e.description,
            name: e.name,
            photo: e.photo,
            price: e.price,
            type: e.type,
            isFavorite: favorites.contains(e.id)))
        .toList();
  }

  ProductViewModel setFavorite() {
    return ProductViewModel(
        id: id,
        available: available,
        photo: photo,
        name: name,
        description: description,
        price: price,
        type: type,
        isFavorite: !isFavorite);
  }
}
