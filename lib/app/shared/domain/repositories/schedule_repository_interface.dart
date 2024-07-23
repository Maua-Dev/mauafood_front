import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleRepository{
  Future<Either<Failure,List<ScheduleModel>>>getAllSchedulesByRestaurant(ScheduleModel restaurant);

  Future<Either<Failure,List<ScheduleModel>>>updateSchedule( ScheduleModel id);

}