
import 'package:mauafood_front/app/shared/domain/entities/schedule.dart';

class SheduleModel extends Schedule{
  SheduleModel(
    {required super.id,
    required super.initialTime,
    required super.endTime, 
    required super.resturant, 
    required super.isActive});

}