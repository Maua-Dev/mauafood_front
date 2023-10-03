import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';

class GetFavoritesError extends Failure {
  GetFavoritesError({required String message}) : super(message: message);
}
