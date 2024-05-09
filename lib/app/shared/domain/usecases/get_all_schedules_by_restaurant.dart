import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/schedule_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IGetAllSchedulesByRestaurantUseCase{
  Future<Either<Failure, SheduleModel>> call(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime);
}

class GetAllSchedule extends IGetAllSchedulesByRestaurantUseCase{
  final IScheduleRepository repository;

  GetAllSchedule(this.repository);
  
  @override
  Future<Either<Failure, SheduleModel>> call(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime) 
  async{
    return await repository.getAllSchedulesByRestaurant(restaurant, initialTime, endTime);
  }


}

