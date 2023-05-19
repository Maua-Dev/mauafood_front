import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

abstract class IGetRestaurant {
  List<Restaurant> call();
}

class GetRestaurant implements IGetRestaurant {
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
