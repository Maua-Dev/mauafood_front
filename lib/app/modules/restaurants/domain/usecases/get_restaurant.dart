import 'package:mauafood_front/app/modules/restaurants/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/modules/restaurants/domain/infra/restaurant_enum.dart';

abstract class GetRestaurantInterface {
  List<Restaurant> call();
}

class GetRestaurantImpl implements GetRestaurantInterface {
  final List<Restaurant> listRestaurant = [
    const Restaurant(restaurantInfo: RestaurantEnum.biba),
    const Restaurant(restaurantInfo: RestaurantEnum.hora_h),
    const Restaurant(restaurantInfo: RestaurantEnum.moleza),
  ];

  @override
  List<Restaurant> call() {
    return listRestaurant;
  }
}
