import 'package:dartz/dartz.dart';
import 'package:mauafood_front/app/shared/domain/repositories/schedule_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IGetScheduleByIdUseCase{
  Future<Either<Failure, SheduleModel>>call(SheduleModel id);
}

class GetScheduleById extends IGetScheduleByIdUseCase{
  final IScheduleRepository repository;

  GetScheduleById(this.repository);
  
  @override
  Future<Either<Failure, SheduleModel>> call(SheduleModel id) 
  async {
    return await repository.getScheduleByid(id);
  }
}