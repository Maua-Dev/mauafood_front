import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/helpers/utils/screen_helper.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  final OrdersController store = Modular.get<OrdersController>();

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
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Observer(builder: (_) {
                        return Expanded(
                            child: Column(
                                children: List.generate(store.ordersList.length,
                                    (index) {
                          return Observer(builder: (_) {
                            return Column(children: [
                              Container(
                                height: 59,
                                color: AppColors.mainBlueColor,
                                child: Column(children: [
                                  Row(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        store.ordersList[index].totalPrice
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                      Text(
                                        store.ordersList[index].status
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                              Collapsible(
                                  collapsed: store.ordersList[index]
                                      .isCollapsedState!.value,
                                  maintainAnimation: true,
                                  axis: CollapsibleAxis.vertical,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.adjust,
                                        size: MediaQuery.of(context)
                                                .size
                                                .shortestSide *
                                            0.5,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )),
                            ]);
                          });
                        })

                                /* List.generate(
                          store.ordersList.length,
                          (index) => ExpansionTile(
                            collapsedIconColor: AppColors.mainBlueColor,
                            trailing: Expanded(
                              child: Container(
                                width: 100,
                                height: 200,
                                color: AppColors.errorColor,
                              ),
                            ),
                            title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    store.ordersList[index].products.length,
                                    (productIndex) => Text(store
                                        .ordersList[index].products[productIndex]
                                        .toString()))),
                            subtitle: Text(
                                store.ordersList[index].totalPrice.toString()),
                            children: [
                              Text(store.ordersList[index].description),
                            ],
                          ),
                        ) */
                                ));
                      })),
                ),
              ),
            ),
          ],
        ));
  }
}
