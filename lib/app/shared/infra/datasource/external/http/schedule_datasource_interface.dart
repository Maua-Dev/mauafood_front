
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleDataSource{
  Future<SheduleModel>
  getAllSchedulesByRestaurant(SheduleModel restaurant, SheduleModel initialTime, SheduleModel endTime);
  Future<SheduleModel>updateSchedule(SheduleModel? initialTime,SheduleModel? endTime, SheduleModel isActive);
  Future<SheduleModel>getScheduleByid(SheduleModel id);
}