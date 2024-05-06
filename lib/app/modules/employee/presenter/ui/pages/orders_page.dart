import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/orders/orders_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/order_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/orders/orders_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/error_loading_menu_widget.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../shared/widgets/text_field_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
                                    store.ordersList.isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                minHeight: 35.0,
                                                maxHeight: 50,
                                              ),
                                              child:
                                                  Observer(builder: (context) {
                                                return ListView.builder(
                                                  itemCount:
                                                      store.statusList.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 6),
                                                      child: ActionChip(
                                                        elevation: 2,
                                                        backgroundColor:
                                                            store.statusIndex ==
                                                                    index
                                                                ? AppColors
                                                                    .mainBlueColor
                                                                : Colors.white,
                                                        onPressed: () {
                                                          store.setStatusIndex(
                                                              index,
                                                              store.statusList[
                                                                  index]);
                                                        },
                                                        label: Text(
                                                            store
                                                                .statusList[
                                                                    index]
                                                                .name,
                                                            style: store.statusIndex ==
                                                                    index
                                                                ? AppTextStyles.h2.copyWith(
                                                                    color: AppColors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                                : AppTextStyles
                                                                    .h2
                                                                    .copyWith(
                                                                        color: store
                                                                            .statusList[index]
                                                                            .color)),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    Observer(builder: (context) {
                                      var orderState = store.orderState;
                                      return Expanded(
                                          child: store.ordersList.isNotEmpty
                                              ? ListView.builder(
                                                  itemCount:
                                                      state.ordersList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return AbsorbPointer(
                                                      absorbing: orderState
                                                              is OrderLoadingState &&
                                                          orderState.index ==
                                                              index,
                                                      child: Opacity(
                                                        opacity: orderState
                                                                    is OrderLoadingState &&
                                                                orderState
                                                                        .index ==
                                                                    index
                                                            ? 0.5
                                                            : 1,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: AppColors
                                                                          .backgroundColor,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color: AppColors
                                                                              .letterColor
                                                                              .withOpacity(0.2),
                                                                          spreadRadius:
                                                                              1,
                                                                          blurRadius:
                                                                              1,
                                                                          offset: const Offset(
                                                                              2,
                                                                              4),
                                                                        ),
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                              child: Observer(
                                                                  builder:
                                                                      (context) {
                                                                return ExpansionTile(
                                                                  onExpansionChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      state
                                                                          .ordersList[
                                                                              index]
                                                                          .isExpanded = value;
                                                                    });
                                                                  },
                                                                  shape:
                                                                      const Border(),
                                                                  tilePadding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8),
                                                                  collapsedIconColor:
                                                                      AppColors
                                                                          .mainBlueColor,
                                                                  iconColor:
                                                                      AppColors
                                                                          .mainBlueColor,
                                                                  textColor:
                                                                      AppColors
                                                                          .mainBlueColor,
                                                                  title:
                                                                      IntrinsicHeight(
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              16,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                state.ordersList[index].status.color,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(10),
                                                                              topLeft: Radius.circular(10),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                16),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: ScreenHelper.width(context) < 425 ? 80 : 160,
                                                                                    child: Text(
                                                                                      overflow: TextOverflow.clip,
                                                                                      state.ordersList[index].userName!,
                                                                                      style: AppTextStyles.h1.copyWith(fontSize: ScreenHelper.width(context) < 425 ? 16 : 20),
                                                                                    ),
                                                                                  ),
                                                                                  if (state.ordersList[index].status == StatusEnum.PENDING)
                                                                                    Row(
                                                                                      children: [
                                                                                        IconButton(
                                                                                            onPressed: () {
                                                                                              var orderListIndex = store.ordersList.indexOf(state.ordersList[index]);
                                                                                              store.changeOrderStatus(orderListIndex, StatusEnum.PREPARING, context);
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
                                                                                    DateTime.fromMillisecondsSinceEpoch(state.ordersList[index].creationTime!, isUtc: true).toString().substring(10, 16),
                                                                                    style: AppTextStyles.h1.copyWith(fontSize: ScreenHelper.width(context) < 425 ? 14 : 16),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(height: 8),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: List.generate(
                                                                                  state.ordersList[index].products!.length,
                                                                                  (productIndex) => Padding(
                                                                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "• ${state.ordersList[index].products![productIndex].quantity} x ${state.ordersList[index].products![productIndex].name}",
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          style: AppTextStyles.h2.copyWith(fontSize: 16),
                                                                                        ),
                                                                                        if (state.ordersList[index].isExpanded)
                                                                                          Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              const SizedBox(height: 8),
                                                                                              Text(
                                                                                                S.of(context).observationTitle,
                                                                                                style: AppTextStyles.h2HighlightBold.copyWith(fontSize: 14, color: AppColors.letterColor),
                                                                                              ),
                                                                                              const SizedBox(height: 4),
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(border: Border.all(color: AppColors.letterThinColor)),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                                  child: Text(
                                                                                                    state.ordersList[index].products![productIndex].observation == null || state.ordersList[index].products![productIndex].observation == "" ? S.of(context).withoutObservationTitle : state.ordersList[index].products![productIndex].observation!,
                                                                                                    style: AppTextStyles.h3.copyWith(fontSize: 14),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                S.of(context).totalTitle,
                                                                                style: AppTextStyles.h2HighlightBold.copyWith(fontSize: 14, color: AppColors.letterColor),
                                                                              ),
                                                                              const SizedBox(height: 4),
                                                                              Text(
                                                                                S.of(context).productPriceCurrency(
                                                                                      state.ordersList[index].totalPrice!,
                                                                                    ),
                                                                                style: AppTextStyles.h1.copyWith(fontSize: ScreenHelper.width(context) < 425 ? 14 : 16),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .fromLTRB(
                                                                          16,
                                                                          0,
                                                                          16,
                                                                          16),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          if (state.ordersList[index].status == StatusEnum.PREPARING ||
                                                                              state.ordersList[index].status == StatusEnum.READY)
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: Alignment.centerRight,
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
                                                                                            value: StatusEnum.PREPARING,
                                                                                            child: Text(
                                                                                              StatusEnum.PREPARING.name,
                                                                                              style: AppTextStyles.h1.copyWith(fontSize: 16),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                        onChanged: (state.ordersList[index].status == StatusEnum.PREPARING)
                                                                                            ? (value) {
                                                                                                var orderListIndex = store.ordersList.indexOf(state.ordersList[index]);
                                                                                                store.changeOrderStatus(orderListIndex, value as StatusEnum, context);
                                                                                              }
                                                                                            : null),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          const SizedBox(
                                                                            height:
                                                                                8,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                );
                                                              }),
                                                            )),
                                                      ),
                                                    );
                                                  })
                                              : Center(
                                                  child: ErrorLoadingMenuWidget(
                                                      errorMessage: S
                                                          .of(context)
                                                          .emptyOrdersListWarn),
                                                ));
                                    }),
                                  ],
                                )
                              : state is OrdersLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : state is OrdersErrorState
                                      ? Center(
                                          child: ErrorLoadingMenuWidget(
                                            errorMessage: state.failure.message,
                                          ),
                                        )
                                      : Text(S.of(context).errorGeneric);
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
                                store.abortReason = 'Falta de insumo';
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
                                store.abortReason = 'Fechado';
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
                                store.abortReason = 'Sobrecarga';
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
                                  if (store.abortReason != '') {
                                    store.abortOrder(index, context);
                                    store.reasonIndex = 0;
                                    store.abortReason = '';
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
                              store.abortReason = '';
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
                                                        .setAbortReason(value),
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
                                                                  .ordersList
                                                                  .indexOf(state
                                                                          .ordersList[
                                                                      index]);
                                                              store.abortOrder(
                                                                  orderListIndex,
                                                                  context);
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
                                                                      14))),
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
                                    fontSize: 14))),
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
