// ignore_for_file: non_constant_identifier_names

import '../../environments/environment_config.dart';

var baseUrlS3 = EnvironmentConfig.S3_ASSETS_BASE_URL;

var baseLogosGif = '$baseUrlS3/logos/gif';

var baseProfileImages = '$baseUrlS3/profile';

var baseLogosImages = '$baseUrlS3/logos/images';

var baseRestaurantImages = '$baseUrlS3/restaurants/restaurant_front';

var evaluation_background = '$baseRandomImages/evaluation_background.png';

var baseRandomImages = '$baseUrlS3/random';

var splashGif = '$baseLogosGif/splash_screen_gif.gif';

var greyLogo = '$baseLogosImages/grey_logo.png';

var transparentLogo = '$baseLogosImages/transparent_logo.png';

var whiteLogo = '$baseLogosImages/white_logo.png';

var profilePictureSoda = '$baseProfileImages/profile_picture_soda.png';

var profilePictureHamburguer =
    '$baseProfileImages/profile_picture_hamburguer.png';

var profilePictureCoxinha = '$baseProfileImages/profile_picture_coxinha.png';

var profilePicturePotato = '$baseProfileImages/profile_picture_potato.png';

var restaurantImages = {
  'bibaImage': '$baseRestaurantImages/front_souza_de_abreu.jpg',
  'hora_hImage': '$baseRestaurantImages/front_restaurante_h.jpg',
  'molezaImage': '$baseRestaurantImages/front_moleza.jpg'
};
