
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleDataSource{
  Future<List<SheduleModel>>
  getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime);
  Future<List<SheduleModel>> updateSchedule(SheduleModel id, SheduleModel initialTime,SheduleModel  endTime, SheduleModel isActive);
}