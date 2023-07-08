import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/new-product/new_product_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/product_card_widget.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'dart:io';

import '../../../../../../../generated/l10n.dart';

class NewProductDialogWidget extends StatefulWidget {
  const NewProductDialogWidget({super.key});

  @override
  State<NewProductDialogWidget> createState() => _NewProductDialogWidgetState();
}

class _NewProductDialogWidgetState extends State<NewProductDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newProductController = Modular.get<NewProductController>();
    return AlertDialog(
        scrollable: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(S.of(context).createProductTitle,
              style: AppTextStyles.h2HighlightBold.copyWith(fontSize: 16)),
          IconButton(
              onPressed: () => Modular.to.pop(),
              icon: Icon(Icons.close, color: AppColors.mainBlueColor)),
        ]),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () => newProductController.setProductImage(),
                      child: Ink(
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
                              S.of(context).photoTitle,
                              style: AppTextStyles.h2.copyWith(
                                color: AppColors.mainBlueColor,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Observer(builder: (_) {
                    return Flexible(
                      child: Text(
                        newProductController.productName ?? "",
                        style: AppTextStyles.h1.copyWith(
                            color: AppColors.mainBlueColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            overflow: TextOverflow.clip),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                title: S.of(context).nameTitle,
                onChanged: (value) =>
                    newProductController.setProductName(value),
                validator: newProductController.validateProductName,
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
                validator: newProductController.validateProductPrepareTime,
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
                            decimalDigits: 2,
                            symbol: 'R\$',
                            enableNegative: false),
                      ],
                      validator: newProductController.validateProductPrice,
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
                        Observer(builder: (_) {
                          return DropdownButtonFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                suffixIconColor: AppColors.mainBlueColor,
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.mainBlueColor,
                                        width: 2))),
                            validator: newProductController.validateProductType,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            borderRadius: BorderRadius.circular(10),
                            focusColor: AppColors.white,
                            isExpanded: true,
                            style: AppTextStyles.h2
                                .copyWith(overflow: TextOverflow.ellipsis),
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
                        }),
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
                validator: newProductController.validateDescription,
              ),
              const SizedBox(
                height: 8,
              ),
              Observer(builder: (_) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(S.of(context).productAvailabilityTitle,
                        textAlign: TextAlign.center,
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
              Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 32,
                runSpacing: 8,
                children: [
                  TextButton(
                      style: ButtonStyle(side:
                          MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                        return BorderSide(color: AppColors.mainBlueColor);
                      })),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (BuildContext buildContext) {
                                return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(S.of(context).previewTitle,
                                            style: AppTextStyles.h2HighlightBold
                                                .copyWith(fontSize: 16)),
                                        IconButton(
                                            onPressed: () => Modular.to.pop(),
                                            icon: Icon(Icons.close,
                                                color:
                                                    AppColors.mainBlueColor)),
                                      ],
                                    ),
                                    content: ProductCardWidget(
                                      product: Product(
                                          available: newProductController
                                              .productAvailability,
                                          name:
                                              newProductController.productName!,
                                          description: newProductController
                                              .productDescription!,
                                          prepareTime: newProductController
                                              .productPrepareTime,
                                          price: newProductController
                                              .productPrice!,
                                          type: ProductEnum.ALL,
                                          photo: ""),
                                      onPressed: () {},
                                    ));
                              });
                        }
                      },
                      child: Text(
                        S.of(context).previewTitle,
                        style: AppTextStyles.h2
                            .copyWith(color: AppColors.mainBlueColor),
                      )),
                  TextButton(
                      style: ButtonStyle(side:
                          MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                        return BorderSide(color: AppColors.mainBlueColor);
                      })),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          () {
                            Modular.to.pop();
                            
                          };
                        }
                      },
                      child: Text(
                        S.of(context).saveTitle,
                        style: AppTextStyles.h1.copyWith(
                            color: AppColors.mainBlueColor, fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
