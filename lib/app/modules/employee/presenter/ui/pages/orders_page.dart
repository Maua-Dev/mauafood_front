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
import '../../../../../shared/widgets/text_field_widget.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  final OrdersController store = Modular.get<OrdersController>();
  final _formKey = GlobalKey<FormState>();

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
                                                                          .CANCELED
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
                                                                          : store.statusList[index] == StatusEnum.PENDING
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
                                    Observer(builder: (context) {
                                      return Expanded(
                                        child: ListView.builder(
                                          itemCount: state.ordersList.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .backgroundColor,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: AppColors
                                                                .letterColor
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 1,
                                                            blurRadius: 1,
                                                            offset:
                                                                const Offset(
                                                                    2, 4),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    10.0)),
                                                    child: Observer(
                                                        builder: (context) {
                                                      return ExpansionTile(
                                                        shape: const Border(),
                                                        tilePadding:
                                                            const EdgeInsets
                                                                .all(8),
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
                                                                  color: state.ordersList[index].status ==
                                                                          StatusEnum
                                                                              .CANCELED
                                                                      ? AppColors
                                                                          .redColor
                                                                      : state.ordersList[index].status ==
                                                                              StatusEnum.READY
                                                                          ? AppColors.greenColor
                                                                          : state.ordersList[index].status == StatusEnum.IN_PREPARATION
                                                                              ? AppColors.yellowColor
                                                                              : AppColors.violetColor,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
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
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          width: ScreenHelper.width(context) < 425
                                                                              ? 80
                                                                              : 160,
                                                                          child:
                                                                              Text(
                                                                            overflow:
                                                                                TextOverflow.clip,
                                                                            state.ordersList[index].owner,
                                                                            style:
                                                                                AppTextStyles.h1.copyWith(fontSize: ScreenHelper.width(context) < 425 ? 16 : 20),
                                                                          ),
                                                                        ),
                                                                        if (state.ordersList[index].status ==
                                                                            StatusEnum.PENDING)
                                                                          Row(
                                                                            children: [
                                                                              IconButton(
                                                                                  onPressed: () {
                                                                                    var orderListIndex = store.ordersList!.indexOf(state.ordersList[index]);
                                                                                    store.setOrderStatus(orderListIndex, StatusEnum.IN_PREPARATION);
                                                                                  },
                                                                                  icon: Icon(
                                                                                    Icons.check,
                                                                                    size: ScreenHelper.width(context) < 425 ? 16 : 24,
                                                                                    color: AppColors.mainBlueColor,
                                                                                  )),
                                                                              IconButton(
                                                                                onPressed: () {
                                                                                  showReasonsDialog(context, state, index);
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.close,
                                                                                  size: ScreenHelper.width(context) < 425 ? 16 : 24,
                                                                                ),
                                                                                color: AppColors.redColor,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        const Spacer(),
                                                                        Text(
                                                                          state
                                                                              .ordersList[index]
                                                                              .hour
                                                                              .toString(),
                                                                          style: AppTextStyles
                                                                              .h1
                                                                              .copyWith(fontSize: ScreenHelper.width(context) < 425 ? 14 : 16),
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
                                                                            state.ordersList[index].products.length,
                                                                            (productIndex) =>
                                                                                Text(
                                                                              "• ${state.ordersList[index].products[productIndex]}",
                                                                              style: AppTextStyles.h2.copyWith(fontSize: 16),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          S.of(context).productPriceCurrency(
                                                                                state.ordersList[index].totalPrice,
                                                                              ),
                                                                          style: AppTextStyles
                                                                              .h1
                                                                              .copyWith(fontSize: ScreenHelper.width(context) < 425 ? 14 : 16),
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
                                                                              fontSize: 16),
                                                                    ),
                                                                    if (state
                                                                            .ordersList[
                                                                                index]
                                                                            .status ==
                                                                        StatusEnum
                                                                            .IN_PREPARATION)
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child: DropdownButton(
                                                                              isDense: true,
                                                                              underline: const SizedBox.shrink(),
                                                                              value: state.ordersList[index].status,
                                                                              items: [
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
                                                                                if (value != StatusEnum.CANCELED) {
                                                                                  var orderListIndex = store.ordersList!.indexOf(state.ordersList[index]);
                                                                                  store.setOrderStatus(orderListIndex, value);
                                                                                } else {
                                                                                  showReasonsDialog(context, state, index);
                                                                                }
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
                                                                          color:
                                                                              AppColors.letterThinColor)),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      state.ordersList[index].description !=
                                                                              ""
                                                                          ? state
                                                                              .ordersList[index]
                                                                              .description
                                                                          : S.of(context).withoutDescriptionTitle,
                                                                      style: AppTextStyles
                                                                          .h3
                                                                          .copyWith(
                                                                              fontSize: 14),
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
                                      );
                                    }),
                                  ],
                                )
                              : const SizedBox.shrink();
                        }))),
              ),
            ],
          ),
        ));
  }

  void showReasonsDialog(context, state, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: ScreenHelper.height(context) / 2,
              width: ScreenHelper.width(context),
              child: Align(
                alignment: Alignment.center,
                child: Observer(builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${S.of(context).refuseOrder}?',
                          style: AppTextStyles.h1.copyWith(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          S.of(context).refuseOrderAlert,
                          style: AppTextStyles.h3,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Wrap(
                          runSpacing: 8,
                          spacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            ActionChip(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      color: store.isMissingDescription
                                          ? Theme.of(context).colorScheme.error
                                          : AppColors.lightBlueColor,
                                      width: 1)),
                              backgroundColor: store.reasonIndex == 1
                                  ? AppColors.lightBlueColor
                                  : AppColors.white,
                              onPressed: () {
                                store.reasonIndex = 1;
                                store.reasonDescription = 'Falta de insumo';
                              },
                              label: Text(S.of(context).lackOfInputTitle,
                                  style: AppTextStyles.h1.copyWith(
                                      fontSize: 16,
                                      color: store.reasonIndex == 1
                                          ? AppColors.white
                                          : AppColors.letterColor)),
                            ),
                            ActionChip(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      color: store.isMissingDescription
                                          ? Theme.of(context).colorScheme.error
                                          : AppColors.lightBlueColor,
                                      width: 1)),
                              backgroundColor: store.reasonIndex == 2
                                  ? AppColors.lightBlueColor
                                  : AppColors.white,
                              onPressed: () {
                                store.reasonIndex = 2;
                                store.reasonDescription = 'Fechado';
                              },
                              label: Text(S.of(context).closedTitle,
                                  style: AppTextStyles.h1.copyWith(
                                      fontSize: 16,
                                      color: store.reasonIndex == 2
                                          ? AppColors.white
                                          : AppColors.letterColor)),
                            ),
                            ActionChip(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      color: store.isMissingDescription
                                          ? Theme.of(context).colorScheme.error
                                          : AppColors.lightBlueColor,
                                      width: 1)),
                              backgroundColor: store.reasonIndex == 3
                                  ? AppColors.lightBlueColor
                                  : AppColors.white,
                              onPressed: () {
                                store.reasonIndex = 3;
                                store.reasonDescription = 'Sobrecarga';
                              },
                              label: Text(S.of(context).overloadTitle,
                                  style: AppTextStyles.h1.copyWith(
                                      fontSize: 16,
                                      color: store.reasonIndex == 3
                                          ? AppColors.white
                                          : AppColors.letterColor)),
                            ),
                          ],
                        ),
                        if (store.isMissingDescription == true)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(S.of(context).requiredFieldAlert,
                                    style: AppTextStyles.h3.copyWith(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                        fontSize: 12))),
                          ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: TextButton(
                                onPressed: () {
                                  if (store.reasonDescription != '') {
                                    var orderListIndex = store.ordersList!
                                        .indexOf(state.ordersList[index]);
                                    store.setOrderStatus(
                                        orderListIndex, StatusEnum.CANCELED);
                                    store.reasonIndex = 0;
                                    store.reasonDescription = '';
                                    store.isMissingDescription = false;

                                    Modular.to.pop();
                                  } else {
                                    store.isMissingDescription = true;
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColors.lightBlueColor),
                                child: Text("OK",
                                    style: AppTextStyles.h2
                                        .copyWith(color: AppColors.white)))),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton(
                            onPressed: () {
                              store.reasonIndex = 0;
                              store.reasonDescription = '';
                              store.isMissingDescription = false;
                              showDialog(
                                  barrierColor: null,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      elevation: 0,
                                      scrollable: true,
                                      content: SizedBox(
                                        height:
                                            ScreenHelper.height(context) / 2,
                                        width: ScreenHelper.width(context),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Form(
                                            key: _formKey,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${S.of(context).refuseOrder}?',
                                                    style: AppTextStyles.h1
                                                        .copyWith(fontSize: 24),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    '${S.of(context).whatHappenedTitle}!',
                                                    style: AppTextStyles.h3,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(
                                                    height: 32,
                                                  ),
                                                  TextFieldWidget(
                                                    onChanged: (value) => store
                                                        .setReasonDescription(
                                                            value),
                                                    validator: store
                                                        .validateReasonDescription,
                                                  ),
                                                  const SizedBox(
                                                    height: 32,
                                                  ),
                                                  SizedBox(
                                                      width: double.infinity,
                                                      height: 40,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              var orderListIndex = store
                                                                  .ordersList!
                                                                  .indexOf(state
                                                                          .ordersList[
                                                                      index]);
                                                              store.setOrderStatus(
                                                                  orderListIndex,
                                                                  StatusEnum
                                                                      .CANCELED);
                                                              Modular.to.pop();
                                                              Modular.to.pop();
                                                            }
                                                          },
                                                          style: TextButton.styleFrom(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .lightBlueColor),
                                                          child: Text("OK",
                                                              style: AppTextStyles
                                                                  .h2
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .white)))),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Modular.to.pop();
                                                      },
                                                      child: Text(
                                                          S
                                                              .of(context)
                                                              .goBackTitle,
                                                          style: AppTextStyles
                                                              .h1
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .letterColor,
                                                                  fontSize:
                                                                      14)))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(S.of(context).othersTitle,
                                style: AppTextStyles.h1.copyWith(
                                    color: AppColors.letterColor,
                                    fontSize: 14)))
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        });
  }
}
