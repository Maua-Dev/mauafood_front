import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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
  final String title;
  final String buttonText;
  final String snackBarText;
  const ProductFormDialogWidget(
      {super.key,
      this.product,
      required this.title,
      required this.buttonText,
      required this.snackBarText});

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
      productFormController.setProductAvailability(widget.product!.available);
      productFormController.setProductType(widget.product!.type.name);
      productFormController.setProductName(widget.product!.name);
      productFormController.setProductDescription(widget.product!.description);
      productFormController.setProductPrice(widget.product!.price.toString());
      productFormController
          .setProductPrepareTime(widget.product!.prepareTime.toString());
      productFormController.setProductPhoto(widget.product!.photo);
    }
    return AlertDialog(
        scrollable: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.title,
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
                              key: const Key('productPhoto'),
                              onTap: () =>
                                  productFormController.uploadProductPhoto(),
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
                                                  .uploadedWebPhoto ==
                                              null &&
                                          productFormController
                                                  .uploadedMobilePhoto ==
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
                                          child: productFormController
                                                      .productPhoto ==
                                                  null
                                              ? kIsWeb
                                                  ? Image.memory(
                                                      productFormController
                                                          .uploadedWebPhoto!,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.file(
                                                      productFormController
                                                          .uploadedMobilePhoto!,
                                                      fit: BoxFit.contain,
                                                    )
                                              : Image.network(
                                                  productFormController
                                                      .productPhoto!,
                                                  fit: BoxFit.contain,
                                                ),
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
                  initialValue: productFormController.productName,
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
                  initialValue:
                      productFormController.productPrepareTime?.toString(),
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
                        initialValue: widget.product != null
                            ? NumberFormat.currency(
                                symbol: 'R\$',
                              ).format(widget.product?.price)
                            : "",
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
                              value: productFormController.productType?.name,
                              onChanged: (value) =>
                                  productFormController.setProductType(value!),
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
                  initialValue: productFormController.productDescription,
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
                          productFormController.isPhotoUploaded = false;
                          if (productFormController.uploadedWebPhoto != null ||
                              productFormController.uploadedMobilePhoto !=
                                  null ||
                              productFormController.productPhoto != null) {
                            productFormController.isPhotoUploaded = true;
                          }
                          if (_formKey.currentState!.validate() &&
                              productFormController.isPhotoUploaded == true) {
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
                                              .productPrepareTime!,
                                          price: productFormController
                                              .productPrice!,
                                          type: productFormController
                                              .productType!,
                                          photo: productFormController
                                                  .productPhoto ??
                                              '',
                                        ),
                                        webPhoto: productFormController
                                            .uploadedWebPhoto,
                                        mobilePhoto: productFormController
                                            .uploadedMobilePhoto,
                                      ));
                                });
                          }
                        },
                        child: Text(
                          S.of(context).previewTitle,
                          style: AppTextStyles.h2
                              .copyWith(color: AppColors.mainBlueColor),
                        )),
                    Observer(builder: ((context) {
                      return TextButton(
                          style: ButtonStyle(
                              backgroundColor: productFormController
                                      .wasProductFormChanged(widget.product)
                                  ? MaterialStateProperty.all<Color>(
                                      AppColors.backgroundColor)
                                  : MaterialStateProperty.all<Color>(
                                      AppColors.letterColor.withOpacity(0.2)),
                              side: MaterialStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                return BorderSide(
                                    color: AppColors.mainBlueColor);
                              })),
                          onPressed: productFormController
                                  .wasProductFormChanged(widget.product)
                              ? () {
                                  productFormController.isPhotoUploaded = false;
                                  if (productFormController.uploadedWebPhoto !=
                                          null ||
                                      productFormController
                                              .uploadedMobilePhoto !=
                                          null ||
                                      widget.product?.photo != null) {
                                    productFormController.isPhotoUploaded =
                                        true;
                                  }
                                  if (_formKey.currentState!.validate() &&
                                      productFormController.isPhotoUploaded ==
                                          true) {
                                    Modular.to.pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(widget.snackBarText,
                                          style: AppTextStyles.h2.copyWith(
                                              color: AppColors.white)),
                                    ));
                                  }
                                }
                              : null,
                          child: Text(
                            widget.buttonText,
                            style: AppTextStyles.h1.copyWith(
                                color: AppColors.mainBlueColor, fontSize: 16),
                          ));
                    }))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
