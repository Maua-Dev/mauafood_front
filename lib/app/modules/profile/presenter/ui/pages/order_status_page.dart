// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/profile/presenter/controllers/order_status_controller.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/widgets/order_status/order_status_lines.dart';
import 'package:mauafood_front/app/shared/domain/enums/status_enum.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class OrderStatusPage extends StatefulWidget {
  OrderStatusPage({super.key, required this.orderId});
  String orderId;

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  OrderStatusController store = Modular.get<OrderStatusController>();

  @override
  void initState() {
    store.startPolling(widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor2,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Observer(builder: (_) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                store.orderStatus.name,
                                style: AppTextStyles.h2.copyWith(
                                  color: AppColors.letterThinColor,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          const OrderStatusLines(),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: AppColors.mainBlueColor,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Text(
                                  store.orderStatus.alert,
                                  style: AppTextStyles.h2HighlightBold.copyWith(
                                    color: AppColors.letterColor,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Observer(builder: (_) {
                            return ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 250),
                              child: SizedBox(
                                  child:
                                      Image.network(store.orderStatus.image)),
                            );
                          }),
                        ],
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
