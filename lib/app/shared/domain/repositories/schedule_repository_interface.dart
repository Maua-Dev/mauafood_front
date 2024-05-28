import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleRepository{
  Future<Either<Failure,SheduleModel>>getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime);

  Future<Either<Failure,SheduleModel>>updateSchedule(SheduleModel? initialTime,SheduleModel? endTime, SheduleModel isActive);

}