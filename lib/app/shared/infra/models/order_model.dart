import 'package:mauafood_front/app/shared/domain/entities/order.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';

class OrderModel extends Order {
  OrderModel({
    required super.status,
    required super.id,
    required super.totalPrice,
    required super.products,
    required super.userName,
    required super.userId,
    super.observation,
    required super.creationTime,
    super.abortedReason,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
        id: json['order_id'],
        creationTime: json['creation_time_milliseconds'],
        status: StatusEnumExtension.stringToEnumMap(json['status']),
        observation: json['observation'],
        totalPrice: json['total_price'],
        abortedReason: json['aborted_reason'],
        userId: json['user_id'],
        userName: json['user_name'],
        products: json['products']
            .map((product) => OrderProduct(
                  id: product['product_id'],
                  name: product['product_name'],
                  quantity: product['quantity'],
                ))
            .toList());
  }

  static List<OrderModel> fromMaps(List array) {
    return array.map((e) => OrderModel.fromMap(e)).toList();
  }
}
