import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/utils/screen_helper.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  final OrdersController store = Modular.get<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        body: SafeArea(
          bottom: false,
          child: Column(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        child: Expanded(
                            child: ListView.builder(
                          itemCount: store.ordersList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.letterColor
                                          .withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(2, 4),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: ExpansionTile(
                                shape: const Border(),
                                tilePadding: const EdgeInsets.all(8),
                                collapsedIconColor: AppColors.mainBlueColor,
                                iconColor: AppColors.mainBlueColor,
                                textColor: AppColors.mainBlueColor,
                                title: IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 16,
                                        decoration: BoxDecoration(
                                          color:
                                              store.ordersList[index].status ==
                                                      StatusEnum.PENDING
                                                  ? AppColors.yellowColor
                                                  : store.ordersList[index]
                                                              .status ==
                                                          StatusEnum.READY
                                                      ? AppColors.greenColor
                                                      : AppColors.redColor,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  store.ordersList[index].owner,
                                                  style: AppTextStyles.h1
                                                      .copyWith(fontSize: 20),
                                                ),
                                                Text(
                                                  store.ordersList[index].hour
                                                      .toString(),
                                                  style: AppTextStyles.h1
                                                      .copyWith(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    store.ordersList[index]
                                                        .products.length,
                                                    (productIndex) => Text(
                                                      "• ${store.ordersList[index].products[productIndex]}",
                                                      style: AppTextStyles.h2
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  S
                                                      .of(context)
                                                      .productPriceCurrency(
                                                        store.ordersList[index]
                                                            .totalPrice,
                                                      ),
                                                  style: AppTextStyles.h1
                                                      .copyWith(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              S.of(context).descriptionTitle,
                                              style: AppTextStyles.h1
                                                  .copyWith(fontSize: 16),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors
                                                      .letterThinColor)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              store.ordersList[index]
                                                  .description,
                                              style: AppTextStyles.h3
                                                  .copyWith(fontSize: 14),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )))),
              ),
            ],
          ),
        ));
  }
}
