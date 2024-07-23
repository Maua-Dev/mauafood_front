
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

abstract class IScheduleDataSource{
  Future<List<ScheduleModel>>
  getAllSchedulesByRestaurant(ScheduleModel restaurant);
  Future<List<ScheduleModel>> updateSchedule(ScheduleModel id);
}