import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/schedule_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IUpdateScheduleUseCase{
  Future<Either<Failure,List<ScheduleModel>>>call( ScheduleModel id);
}

class UpdateSchedule extends IUpdateScheduleUseCase{
  final IScheduleRepository repository;

  UpdateSchedule(this.repository);
  
  @override
  Future<Either<Failure,List<ScheduleModel>>>call(ScheduleModel id)
  async {
    return await repository.updateSchedule(id);
    
  }
}