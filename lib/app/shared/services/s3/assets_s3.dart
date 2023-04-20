// ignore_for_file: non_constant_identifier_names

import '../environments/environment_config.dart';

var baseUrlS3 = EnvironmentConfig.S3_ASSETS_BASE_URL;

var baseLogosGif = '$baseUrlS3/logos/gif';

var baseLogosImages = '$baseUrlS3/logos/images';

var baseRestaurantImages = '$baseUrlS3/restaurants/restaurant_front';

var splashGif = '$baseLogosGif/splash_screen_gif.gif';

var greyLogo = '$baseLogosImages/grey_logo.png';

var transparentLogo = '$baseLogosImages/transparent_logo.png';

var whiteLogo = '$baseLogosImages/white_logo.png';

var restaurantImages = {
  'bibaImage': '$baseRestaurantImages/front_souza_de_abreu.jpg',
  'hora_hImage': '$baseRestaurantImages/front_restaurante_h.jpg',
  'molezaImage': '$baseRestaurantImages/front_moleza.jpg'
};
