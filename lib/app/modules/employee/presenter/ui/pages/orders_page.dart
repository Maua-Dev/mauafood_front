import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/helpers/utils/screen_helper.dart';

class OrdersPage extends StatelessWidget {
  final OrdersController store = Modular.get<OrdersController>();
  OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: ScreenHelper.height(context) * 0.1),
            Container(
              height: ScreenHelper.height(context) * 0.9,
              width: ScreenHelper.width(context),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor2,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: store.ordersList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(store.ordersList[index].products[0]),
                        subtitle:
                            Text(store.ordersList[index].totalPrice.toString()),
                        trailing:
                            Text(store.ordersList[index].status.toString()),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
