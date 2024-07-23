import 'package:mauafood_front/app/shared/helpers/services/http/http_request_interface.dart';
import 'package:mauafood_front/app/shared/infra/datasource/external/http/schedule_datasource_interface.dart';
import 'package:mauafood_front/app/shared/infra/models/schedule_model.dart';

class ScheduleDataSource implements IScheduleDataSource{
  @override

  final IHttpRequest _client;

  ScheduleDataSource(this._client);

  @override
  Future<List<ScheduleModel>> getAllSchedulesByRestaurant(ScheduleModel restaurant) async{
    // final response = await _client.get(
    //   '/getAllSchedulesByRestaurant',
    //   {
    //     "Message": "All Schedule found",
    //     "schedules":[
    //       {
    //       "id":id,
    //       "initial_time": initialTime,
    //       "end_time": endTime,
    //       "accepted_reservation": acceptedReservation
    //       }
    //     ]
    //   }
    // );

    
  
    // TODO: implement getAllSchedulesByRestaurant
    throw UnimplementedError();
  }

  @override
  Future<List<ScheduleModel>> updateSchedule(ScheduleModel id) {
    // TODO: implement updateSchedule
    throw UnimplementedError();
  }

  

  
}