
import 'package:mauafood_front/app/shared/infra/datasource/external/http/schedule_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

class ScheduleDataSource implements IScheduleDataSource{
  @override
  Future<List<SheduleModel>> getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel  endTime) {
    // TODO: implement getAllSchedulesByRestaurant
    throw UnimplementedError();
  }

  @override
  Future<List<SheduleModel>> updateSchedule(SheduleModel id,  SheduleModel initialTime, SheduleModel  endTime, SheduleModel isActive) {
    // TODO: implement updateSchedule
    throw UnimplementedError();
  }

  

  
}