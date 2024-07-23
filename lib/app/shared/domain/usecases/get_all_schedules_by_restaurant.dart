import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/schedule_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IGetAllSchedulesByRestaurantUseCase{
  Future<Either<Failure,List<ScheduleModel>>>call(ScheduleModel restaurant);
}

class GetAllSchedule extends IGetAllSchedulesByRestaurantUseCase{
  final IScheduleRepository repository;

  GetAllSchedule(this.repository);
  
  @override
  Future<Either<Failure,List<ScheduleModel>>>call(ScheduleModel restaurant) 
  async{
    return await repository.getAllSchedulesByRestaurant(restaurant);
  }


}

