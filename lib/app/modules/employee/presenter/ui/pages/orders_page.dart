import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/orders_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../shared/widgets/filter_button_widget.dart';

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
                            vertical: 16, horizontal: 16),
                        child: Observer(builder: (context) {
                          var state = store.state;
                          return state is OrdersLoadedSuccessState
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          minHeight: 35.0,
                                          maxHeight: 50,
                                        ),
                                        child: Observer(builder: (context) {
                                          return ListView.builder(
                                            itemCount: store.statusList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 6),
                                                child: ActionChip(
                                                  elevation: 2,
                                                  backgroundColor:
                                                      store.statusIndex == index
                                                          ? AppColors
                                                              .mainBlueColor
                                                          : Colors.white,
                                                  onPressed: () {
                                                    store.setStatusIndex(
                                                        index,
                                                        store
                                                            .statusList[index]);
                                                  },
                                                  label: Text(
                                                      store.statusList[index]
                                                          .name,
                                                      style: store.statusIndex ==
                                                              index
                                                          ? AppTextStyles.h2
                                                              .copyWith(
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)
                                                          : AppTextStyles.h2
                                                              .copyWith(
                                                              color: store.statusList[
                                                                          index] ==
                                                                      StatusEnum
                                                                          .PENDING
                                                                  ? AppColors
                                                                      .redColor
                                                                  : store.statusList[
                                                                              index] ==
                                                                          StatusEnum
                                                                              .READY
                                                                      ? AppColors
                                                                          .greenColor
                                                                      : store.statusList[index] ==
                                                                              StatusEnum.IN_PREPARATION
                                                                          ? AppColors.yellowColor
                                                                          : store.statusList[index] == StatusEnum.CANCELED
                                                                              ? AppColors.violetColor
                                                                              : AppColors.mainBlueColor,
                                                            )),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: state.ordersList.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .backgroundColor,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColors
                                                              .letterColor
                                                              .withOpacity(0.2),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: const Offset(
                                                              2, 4),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Observer(
                                                      builder: (context) {
                                                    return ExpansionTile(
                                                      shape: const Border(),
                                                      tilePadding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      collapsedIconColor:
                                                          AppColors
                                                              .mainBlueColor,
                                                      iconColor: AppColors
                                                          .mainBlueColor,
                                                      textColor: AppColors
                                                          .mainBlueColor,
                                                      title: IntrinsicHeight(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 16,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: state
                                                                            .ordersList[
                                                                                index]
                                                                            .status ==
                                                                        StatusEnum
                                                                            .PENDING
                                                                    ? AppColors
                                                                        .redColor
                                                                    : state.ordersList[index].status ==
                                                                            StatusEnum
                                                                                .READY
                                                                        ? AppColors
                                                                            .greenColor
                                                                        : state.ordersList[index].status ==
                                                                                StatusEnum.IN_PREPARATION
                                                                            ? AppColors.yellowColor
                                                                            : AppColors.violetColor,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 16),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        state
                                                                            .ordersList[index]
                                                                            .owner,
                                                                        style: AppTextStyles
                                                                            .h1
                                                                            .copyWith(fontSize: 20),
                                                                      ),
                                                                      Text(
                                                                        state
                                                                            .ordersList[index]
                                                                            .hour
                                                                            .toString(),
                                                                        style: AppTextStyles
                                                                            .h1
                                                                            .copyWith(fontSize: 16),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          8),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            List.generate(
                                                                          state
                                                                              .ordersList[index]
                                                                              .products
                                                                              .length,
                                                                          (productIndex) =>
                                                                              Text(
                                                                            "• ${state.ordersList[index].products[productIndex]}",
                                                                            style:
                                                                                AppTextStyles.h2.copyWith(fontSize: 16),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        S
                                                                            .of(context)
                                                                            .productPriceCurrency(
                                                                              state.ordersList[index].totalPrice,
                                                                            ),
                                                                        style: AppTextStyles
                                                                            .h1
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
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  16,
                                                                  0,
                                                                  16,
                                                                  16),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    S
                                                                        .of(context)
                                                                        .descriptionTitle,
                                                                    style: AppTextStyles
                                                                        .h1
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child: DropdownButton(
                                                                          isDense: true,
                                                                          underline: const SizedBox.shrink(),
                                                                          value: state.ordersList[index].status,
                                                                          items: [
                                                                            DropdownMenuItem(
                                                                              value: StatusEnum.PENDING,
                                                                              child: Text(
                                                                                StatusEnum.PENDING.name,
                                                                                style: AppTextStyles.h1.copyWith(fontSize: 16),
                                                                              ),
                                                                            ),
                                                                            DropdownMenuItem(
                                                                              value: StatusEnum.READY,
                                                                              child: Text(
                                                                                StatusEnum.READY.name,
                                                                                style: AppTextStyles.h1.copyWith(fontSize: 16),
                                                                              ),
                                                                            ),
                                                                            DropdownMenuItem(
                                                                              value: StatusEnum.IN_PREPARATION,
                                                                              child: Text(
                                                                                StatusEnum.IN_PREPARATION.name,
                                                                                style: AppTextStyles.h1.copyWith(fontSize: 16),
                                                                              ),
                                                                            ),
                                                                            DropdownMenuItem(
                                                                              value: StatusEnum.CANCELED,
                                                                              child: Text(
                                                                                StatusEnum.CANCELED.name,
                                                                                style: AppTextStyles.h1.copyWith(fontSize: 16),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          onChanged: (value) {
                                                                            store.setOrderStatus(index,
                                                                                value);
                                                                          }),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: AppColors
                                                                            .letterThinColor)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Text(
                                                                    state.ordersList[index].description !=
                                                                            ""
                                                                        ? state
                                                                            .ordersList[
                                                                                index]
                                                                            .description
                                                                        : S
                                                                            .of(context)
                                                                            .withoutDescriptionTitle,
                                                                    style: AppTextStyles
                                                                        .h3
                                                                        .copyWith(
                                                                            fontSize:
                                                                                14),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  }),
                                                )),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink();
                        }))),
              ),
            ],
          ),
        ));
  }
}
