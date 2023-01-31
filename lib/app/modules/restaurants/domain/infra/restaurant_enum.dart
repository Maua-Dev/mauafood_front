enum RestaurantEnum { restaurantBiba, restaurantH }

extension RestaurantEnumExtension on RestaurantEnum {
  String get name {
    switch (this) {
      case RestaurantEnum.restaurantBiba:
        return 'Souza de Abreu';
      case RestaurantEnum.restaurantH:
        return 'Restaurante do H';
    }
  }

  String get restaurantImg {
    switch (this) {
      case RestaurantEnum.restaurantBiba:
        return 'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg';

      case RestaurantEnum.restaurantH:
        return 'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg';
    }
  }
}
