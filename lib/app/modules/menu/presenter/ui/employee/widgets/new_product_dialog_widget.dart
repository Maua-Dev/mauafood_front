import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/new-product/new_product_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/widgets/product_card_employee_widget.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/helpers/utils/validation_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../../../../../../../generated/l10n.dart';

class NewProductDialogWidget extends StatelessWidget {
  const NewProductDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var newProductController = Modular.get<NewProductController>();
    return AlertDialog(
        content: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.mainBlueColor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Icon(
                      Icons.fastfood,
                      color: AppColors.mainBlueColor,
                    ),
                    Text(
                      S.of(context).editTitle,
                      style: AppTextStyles.h2
                          .copyWith(color: AppColors.mainBlueColor),
                    )
                  ]),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Observer(builder: (_) {
                return Text(
                  newProductController.productName ?? "",
                  style: AppTextStyles.h1.copyWith(
                      color: AppColors.mainBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            title: S.of(context).nameTitle,
            onChanged: (value) => newProductController.setProductName(value),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFieldWidget(
            title: S.of(context).prepareTimeTitle,
            keyboardType: TextInputType.number,
            suffixText: S.of(context).minutesTitle,
            onChanged: (value) =>
                newProductController.setProductPrepareTime(value),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFieldWidget(
                  title: S.of(context).priceTitle,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      newProductController.setProductPrice(value),
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                        decimalDigits: 2, symbol: 'R\$', enableNegative: false),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).categoryTitle,
                      style: AppTextStyles.h2
                          .copyWith(color: AppColors.mainBlueColor),
                    ),
                    InputDecorator(
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            suffixIconColor: AppColors.mainBlueColor,
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.mainBlueColor, width: 2))),
                        child: Observer(builder: (_) {
                          return DropdownButton(
                            underline: const SizedBox(),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            borderRadius: BorderRadius.circular(10),
                            focusColor: AppColors.white,
                            isExpanded: true,
                            items: ProductEnum.values
                                .where((ProductEnum productEnum) =>
                                    productEnum != ProductEnum.ALL)
                                .map((productEnum) {
                              return DropdownMenuItem<String>(
                                  value: productEnum.name,
                                  child: Text(productEnum.name.toString()));
                            }).toList(),
                            value: newProductController.productType,
                            onChanged: (value) => newProductController
                                .setProductType(value.toString()),
                          );
                        })),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextFieldWidget(
            title: S.of(context).descriptionTitle,
            onChanged: (value) =>
                newProductController.setProductDescription(value),
          ),
          const SizedBox(
            height: 8,
          ),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(S.of(context).productAvailabilityTitle,
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.mainBlueColor,
                    )),
                Switch(
                  value: newProductController.productAvailability,
                  onChanged: (value) =>
                      newProductController.setProductAvailability(value),
                  activeColor: AppColors.mainBlueColor,
                )
              ],
            );
          }),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  style: ButtonStyle(side: MaterialStateBorderSide.resolveWith(
                      (Set<MaterialState> states) {
                    return BorderSide(color: AppColors.mainBlueColor);
                  })),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext buildContext) {
                          return AlertDialog(
                              content: ProductCardEmployeeWidget(
                                  product: Product(
                                      available: newProductController
                                          .productAvailability,
                                      name: newProductController.productName!,
                                      description: newProductController
                                          .productDescription!,
                                      prepareTime: newProductController
                                          .productPrepareTime,
                                      price: newProductController.productPrice!,
                                      type:
                                          ProductEnumExtension.stringToEnumMap(
                                              newProductController
                                                  .productType!),
                                      lastUpdate: DateTime.now(),
                                      id: "",
                                      photo:
                                          "https://avatars.githubusercontent.com/u/24724451?v=4")));
                        });
                  },
                  child: Text(
                    S.of(context).previewTitle,
                    style: AppTextStyles.h2
                        .copyWith(color: AppColors.mainBlueColor),
                  )),
              TextButton(
                  style: ButtonStyle(side: MaterialStateBorderSide.resolveWith(
                      (Set<MaterialState> states) {
                    return BorderSide(color: AppColors.mainBlueColor);
                  })),
                  onPressed: () {},
                  child: Text(
                    S.of(context).saveTitle,
                    style: AppTextStyles.h1
                        .copyWith(color: AppColors.mainBlueColor, fontSize: 16),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
