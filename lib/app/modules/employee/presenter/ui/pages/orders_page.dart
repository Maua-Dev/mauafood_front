import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
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
            const SizedBox(height: 48),
            Expanded(
              child: Container(
                width: ScreenHelper.width(context),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor2,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Observer(builder: (_) {
                    return Expanded(
                      child: Column(children: [
                        ExpansionPanelList(
                            expansionCallback: (panelIndex, isExpanded) {
                              store.setIsPanelExpanded(panelIndex);
                            },
                            children: List.generate(
                                store.ordersList.length,
                                (index) => ExpansionPanel(
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          title: Text(store
                                              .ordersList[index].products[0]),
                                          subtitle: Text(store
                                              .ordersList[index].totalPrice
                                              .toString()),
                                          trailing: Text(store
                                              .ordersList[index].status
                                              .toString()),
                                        );
                                      },
                                      body: ListTile(
                                        title: Text(store
                                            .ordersList[index].description),
                                      ),
                                      isExpanded: store
                                          .ordersList[index].isExpanded!.value,
                                    )))
                      ]),
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}
