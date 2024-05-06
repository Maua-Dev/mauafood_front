import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/states/order_status_state.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/error_loading_menu_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../controllers/order_status_controller.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderStatusController store = Modular.get<OrderStatusController>();

    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        appBar: AppBar(
          toolbarHeight: 150,
          centerTitle: true,
          title: SizedBox(
            child: Image.network(
              whiteLogo,
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: AppColors.mainBlueColor,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Observer(builder: ((context) {
          var state = store.state;
          return Column(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor2,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                          )),
                      child: state is LoadingOrderStatusState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is ErrorOrderStatusState
                              ? Center(
                                  child: ErrorLoadingMenuWidget(
                                  errorMessage: state.message,
                                ))
                              : Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.backgroundColor2,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(40),
                                              )),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 24,
                                                      horizontal: 24),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      store.order.status.name,
                                                      style: AppTextStyles.h2
                                                          .copyWith(
                                                        color: AppColors
                                                            .letterThinColor,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 4,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .mainBlueColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 4,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: store.order
                                                                        .status !=
                                                                    StatusEnum
                                                                        .PENDING
                                                                ? AppColors
                                                                    .mainBlueColor
                                                                : AppColors
                                                                    .letterThinColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 4,
                                                          decoration: BoxDecoration(
                                                              color: store.order
                                                                          .status ==
                                                                      StatusEnum
                                                                          .READY
                                                                  ? AppColors
                                                                      .mainBlueColor
                                                                  : AppColors
                                                                      .letterThinColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Container(
                                                          width: 8,
                                                          height: 8,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .mainBlueColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          store.order.status
                                                              .alert,
                                                          style: AppTextStyles
                                                              .h2HighlightBold
                                                              .copyWith(
                                                            color: AppColors
                                                                .letterColor,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  ConstrainedBox(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxHeight: 250),
                                                    child: SizedBox(
                                                        child: Image.network(
                                                            store.order.status
                                                                .image)),
                                                  ),
                                                  if (store.order.status ==
                                                      StatusEnum.PENDING)
                                                    ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxWidth: 400),
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          await store
                                                              .abortOrder();
                                                          Modular.to.navigate(
                                                              '/landing/profile/');
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize:
                                                                const Size
                                                                    .fromHeight(
                                                                    50),
                                                            backgroundColor:
                                                                AppColors
                                                                    .mainBlueColor),
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .cancelOrderTitle,
                                                          style: AppTextStyles
                                                              .h2HighlightBold
                                                              .copyWith(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                )))
            ],
          );
        })));
  }
}
