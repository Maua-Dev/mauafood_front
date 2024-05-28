import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mauafood_front/app/shared/domain/repositories/schedule_repository_interface.dart';
import 'package:mauafood_front/app/shared/helpers/enums/http_status_code_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/helpers/functions/get_http_status_function.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/schedule_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

class SheduleRepository extends IScheduleRepository{

  final IScheduleDataSource dataSource;

  SheduleRepository({required this.dataSource});
  @override
  Future<Either<Failure,List<SheduleModel>>>getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime)
  async {
    try{
      var response = await dataSource.getAllSchedulesByRestaurant(restaurant, initialTime, endTime);
      return right(response);
    } on DioError catch(e){
      HttpStatusCodeEnum errorType = getHttpStatusFunction(e.response!.statusCode);

      return left(ErrorRequest(message: errorType.errorMessage));

    }
  }

  @override
  Future<Either<Failure,List<SheduleModel>>>updateSchedule( SheduleModel id,SheduleModel initialTime, SheduleModel endTime, SheduleModel isActive) 
  async{
    try{
      var response = await dataSource.updateSchedule(id, initialTime, endTime, isActive);
      return right(response);
    }on DioError catch(e){
      HttpStatusCodeEnum errorType = getHttpStatusFunction(e.response!.statusCode);

      return left(ErrorRequest(message: errorType.errorMessage));
    }

  }
  
}