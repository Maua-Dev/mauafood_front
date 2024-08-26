import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/order_status_controller.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class OrderStatusLines extends StatelessWidget {
  const OrderStatusLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderStatusController store = Modular.get<OrderStatusController>();

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.mainBlueColor,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Observer(builder: (_) {
            return Container(
              height: 4,
              decoration: BoxDecoration(
                color: store.orderStatus != StatusEnum.PENDING
                    ? AppColors.mainBlueColor
                    : AppColors.letterThinColor,
              ),
            );
          }),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Observer(builder: (_) {
            return Container(
              height: 4,
              decoration: BoxDecoration(
                  color: store.orderStatus == StatusEnum.READY
                      ? AppColors.mainBlueColor
                      : AppColors.letterThinColor),
            );
          }),
        ),
      ],
    );
  }
}
