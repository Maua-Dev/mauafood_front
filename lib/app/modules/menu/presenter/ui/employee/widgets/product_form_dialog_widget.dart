import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/product_card_widget.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../../../../../../../generated/l10n.dart';

class ProductFormDialogWidget extends StatefulWidget {
  final Product? product;
  const ProductFormDialogWidget({super.key, this.product});

  @override
  State<ProductFormDialogWidget> createState() =>
      _ProductFormDialogWidgetState();
}

class _ProductFormDialogWidgetState extends State<ProductFormDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productFormController = Modular.get<ProductFormController>();
    if (widget.product != null) {
      productFormController.productAvailability = widget.product!.available;
      productFormController.productType = widget.product!.type.name;
      productFormController.productName = widget.product!.name;
      productFormController.productPrice =
          double.parse('R\$ ${widget.product!.price.toString()}.00');
    } else {
      productFormController.productAvailability = true;
      productFormController.productType = null;
      productFormController.productName = "";
    }
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
        content: SizedBox(
          width: ScreenHelper.width(context),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Observer(builder: (_) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: InkWell(
                              onTap: () =>
                                  productFormController.setProductImage(),
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: productFormController
                                                    .isPhotoUploaded ==
                                                false
                                            ? Theme.of(context)
                                                .colorScheme
                                                .error
                                            : AppColors.mainBlueColor)),
                                child: SizedBox(
                                  width: 80,
                                  height: 88,
                                  child: (productFormController
                                                  .productWebImage ==
                                              null &&
                                          productFormController
                                                  .productMobileImage ==
                                              null &&
                                          widget.product == null)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                              Icon(
                                                Icons.fastfood,
                                                color: AppColors.mainBlueColor,
                                              ),
                                              Text(
                                                S.of(context).photoTitle,
                                                style:
                                                    AppTextStyles.h2.copyWith(
                                                  color:
                                                      AppColors.mainBlueColor,
                                                ),
                                              )
                                            ])
                                      : Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Expanded(
                                              child: widget.product?.photo ==
                                                      null
                                                  ? kIsWeb
                                                      ? Image.memory(
                                                          productFormController
                                                              .productWebImage!,
                                                          fit: BoxFit.contain,
                                                        )
                                                      : Image.file(
                                                          productFormController
                                                              .productMobileImage!,
                                                          fit: BoxFit.contain,
                                                        )
                                                  : Image.network(
                                                      widget.product!.photo,
                                                      fit: BoxFit.contain,
                                                    )),
                                        ),
                                ),
                              ),
                            ),
                          );
                        }),
                        Observer(builder: (_) {
                          return productFormController.isPhotoUploaded == false
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 8, 0, 0),
                                  child: Text(
                                    S.of(context).requiredFieldAlert,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error),
                                  ),
                                )
                              : Container();
                        })
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Observer(builder: (_) {
                      return Flexible(
                        child: Text(
                          productFormController.productName ?? "",
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
                      productFormController.setProductName(value),
                  validator: productFormController.validateProductName,
                  initialValue: widget.product?.name ?? "",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFieldWidget(
                  title: S.of(context).prepareTimeTitle,
                  keyboardType: TextInputType.number,
                  suffixText: S.of(context).minutesTitle,
                  onChanged: (value) =>
                      productFormController.setProductPrepareTime(value),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: productFormController.validateProductPrepareTime,
                  initialValue: widget.product?.prepareTime.toString() ?? "",
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
                            productFormController.setProductPrice(value),
                        initialValue: widget.product?.price.toString() ?? "",
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              decimalDigits: 2,
                              symbol: 'R\$',
                              enableNegative: false),
                        ],
                        validator: productFormController.validateProductPrice,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  suffixIconColor: AppColors.mainBlueColor,
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.mainBlueColor,
                                          width: 2))),
                              validator:
                                  productFormController.validateProductType,
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
                              value: productFormController.productType,
                              onChanged: (value) => productFormController
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
                      productFormController.setProductDescription(value),
                  initialValue: widget.product?.description ?? "",
                ),
                const SizedBox(
                  height: 8,
                ),
                Observer(builder: (_) {
                  return Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(S.of(context).productAvailabilityTitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h2.copyWith(
                            color: AppColors.mainBlueColor,
                          )),
                      SizedBox(
                        width: 40,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            value: productFormController.productAvailability,
                            onChanged: (value) => productFormController
                                .setProductAvailability(value),
                            activeColor: AppColors.mainBlueColor,
                          ),
                        ),
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
                          productFormController.setIsPhotoUploaded(false);
                          if (productFormController.productWebImage != null ||
                              productFormController.productMobileImage !=
                                  null ||
                              widget.product?.photo != null) {
                            productFormController.setIsPhotoUploaded(true);
                          }
                          if (_formKey.currentState!.validate() &&
                              (productFormController.productWebImage != null ||
                                  productFormController.productMobileImage !=
                                      null ||
                                  widget.product?.photo != null)) {
                            productFormController.setIsPhotoUploaded(true);
                            showDialog(
                                context: context,
                                builder: (BuildContext buildContext) {
                                  return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(S.of(context).previewTitle,
                                              style: AppTextStyles
                                                  .h2HighlightBold
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
                                            available: productFormController
                                                .productAvailability,
                                            name: productFormController
                                                .productName!,
                                            description: productFormController
                                                .productDescription!,
                                            prepareTime: productFormController
                                                .productPrepareTime,
                                            price: productFormController
                                                .productPrice!,
                                            type: ProductEnum.ALL,
                                            photo: ""),
                                        onPressed: () {},
                                        webImage: productFormController
                                            .productWebImage,
                                        mobileImage: productFormController
                                            .productMobileImage,
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
                          productFormController.setIsPhotoUploaded(false);
                          if (productFormController.productWebImage != null ||
                              productFormController.productMobileImage !=
                                  null) {
                            productFormController.setIsPhotoUploaded(true);
                          }
                          if (_formKey.currentState!.validate() &&
                                  productFormController.productWebImage !=
                                      null ||
                              productFormController.productMobileImage !=
                                  null) {
                            Modular.to.pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  S.of(context).productSuccessfullyCreatedTitle,
                                  style: AppTextStyles.h2
                                      .copyWith(color: AppColors.white)),
                            ));
                          }
                        },
                        child: Text(
                          S.of(context).createTitle,
                          style: AppTextStyles.h1.copyWith(
                              color: AppColors.mainBlueColor, fontSize: 16),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
