import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/domain/entities/restaurant.dart';
import 'package:mauafood_front/app/shared/domain/usecases/get_restaurant.dart';

void main() {
  late IGetRestaurant useCase;

  setUp(() async {
    useCase = GetRestaurant();
  });

  test('[TEST] - GetRestaurantImpl', () {
    expect(useCase(), isA<List<Restaurant>>());
    expect(useCase().length, 3);
  });
}
