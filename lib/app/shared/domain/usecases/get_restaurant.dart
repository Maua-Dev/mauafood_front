import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';

abstract class IGetRestaurant {
  List<Restaurant> call();
}

class GetRestaurant implements IGetRestaurant {
  final List<Restaurant> listRestaurant = [
    const Restaurant(restaurantInfo: RestaurantEnum.souza_de_abreu),
    const Restaurant(restaurantInfo: RestaurantEnum.hora_h),
    const Restaurant(restaurantInfo: RestaurantEnum.cantina_do_moleza),
  ];

  @override
  List<Restaurant> call() {
    return listRestaurant;
  }
}
