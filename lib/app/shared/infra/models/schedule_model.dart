
import 'package:mauafood_front/app/shared/domain/entities/schedule.dart';

class ScheduleModel extends Schedule{
  ScheduleModel(
    {required super.id,
    required super.initialTime,
    required super.endTime, 
    required super.resturant, 
    required super.acceptedReservation});


  
factory ScheduleModel.fromMap(Map<String, dynamic> json){
  return ScheduleModel(
    id:json['id'],
    initialTime: json['initialTime'],
    endTime: json['endTime'],
    resturant: json['resturant'],
    acceptedReservation: json['acceptedReservation']);
}

}
