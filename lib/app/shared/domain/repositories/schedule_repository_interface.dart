import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleRepository{
  Future<Either<Failure,List<SheduleModel>>>getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime);

  Future<Either<Failure,List<SheduleModel>>>updateSchedule( SheduleModel id, SheduleModel initialTime,SheduleModel endTime, SheduleModel isActive);

}