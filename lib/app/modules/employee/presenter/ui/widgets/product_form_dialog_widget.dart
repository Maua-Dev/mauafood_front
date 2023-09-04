import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/product-form/product_form_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-form/product_form_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/text_field_widget.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../../../../../../generated/l10n.dart';

class ProductFormDialogWidget extends StatefulWidget {
  final Product? product;
  final String title;
  final String buttonText;
  final String snackBarText;
  final RestaurantEnum restaurant;
  const ProductFormDialogWidget(
      {super.key,
      this.product,
      required this.title,
      required this.buttonText,
      required this.snackBarText,
      required this.restaurant});

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
      productFormController.productPrice = widget.product!.price;

      if (widget.product!.prepareTime != null) {
        productFormController
            .setProductPrepareTime(widget.product!.prepareTime.toString());
      }
      if (widget.product!.description != null) {
        productFormController
            .setProductDescription(widget.product!.description!);
      }
      if (widget.product!.photo != null) {
        productFormController.setProductPhoto(widget.product!.photo);
      }
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlertDialog(
          scrollable: true,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(widget.title,
                style: AppTextStyles.h2HighlightBold.copyWith(fontSize: 16)),
            IconButton(
                onPressed: () => Modular.to.pop(),
                icon: Icon(Icons.close, color: AppColors.mainBlueColor)),
          ]),
          content: Observer(builder: (_) {
            return Stack(alignment: Alignment.center, children: [
              if (productFormController.state is ProductFormLoadingState)
                const CircularProgressIndicator(),
              AbsorbPointer(
                absorbing:
                    productFormController.state is ProductFormLoadingState,
                child: Opacity(
                  opacity:
                      productFormController.state is ProductFormLoadingState
                          ? 0.2
                          : 1,
                  child: SizedBox(
                    width: ScreenHelper.width(context),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Observer(builder: (_) {
                                    return MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                        key: const Key('productPhoto'),
                                        onTap: () => productFormController
                                            .uploadProductPhoto(context),
                                        onLongPress:
                                            (productFormController
                                                            .uploadedPhoto ==
                                                        null &&
                                                    widget.product?.photo ==
                                                        null)
                                                ? null
                                                : () => showDialog(
                                                    context: context,
                                                    builder:
                                                        ((context) =>
                                                            AlertDialog(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              content:
                                                                  ConstrainedBox(
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxHeight:
                                                                            ScreenHelper.height(context) *
                                                                                0.5,
                                                                        maxWidth:
                                                                            ScreenHelper.width(context) *
                                                                                0.5,
                                                                      ),
                                                                      child: productFormController.productPhoto ==
                                                                              null
                                                                          ? Image
                                                                              .memory(
                                                                              productFormController.uploadedPhoto!,
                                                                              fit: BoxFit.contain,
                                                                            )
                                                                          : Image
                                                                              .network(
                                                                              productFormController.productPhoto!,
                                                                              fit: BoxFit.contain,
                                                                            )),
                                                            ))),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      AppColors.mainBlueColor)),
                                          child: SizedBox(
                                            width:
                                                ScreenHelper.width(context) / 5,
                                            height:
                                                ScreenHelper.width(context) / 5,
                                            child: (productFormController
                                                            .uploadedPhoto ==
                                                        null &&
                                                    widget.product?.photo ==
                                                        null)
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                        Icon(
                                                          Icons.fastfood,
                                                          color: AppColors
                                                              .mainBlueColor,
                                                        ),
                                                        Text(
                                                          S
                                                              .of(context)
                                                              .photoTitle,
                                                          style: AppTextStyles
                                                              .h2
                                                              .copyWith(
                                                            color: AppColors
                                                                .mainBlueColor,
                                                          ),
                                                        )
                                                      ])
                                                : productFormController
                                                            .productPhoto ==
                                                        null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.memory(
                                                          productFormController
                                                              .uploadedPhoto!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          productFormController
                                                              .productPhoto!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: TextFieldWidget(
                                      title: S.of(context).nameTitle,
                                      onChanged: (value) =>
                                          productFormController
                                              .setProductName(value),
                                      validator: productFormController
                                          .validateProductName,
                                      initialValue:
                                          productFormController.productName,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFieldWidget(
                            title: S.of(context).prepareTimeTitle,
                            keyboardType: TextInputType.number,
                            suffixText: S.of(context).minutesTitle,
                            onChanged: (value) => productFormController
                                .setProductPrepareTime(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            initialValue: productFormController
                                .productPrepareTime
                                ?.toString(),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 2,
                                child: TextFieldWidget(
                                  maxLenght: 9,
                                  title: S.of(context).priceTitle,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => productFormController
                                      .setProductPrice(value),
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
                                  validator: productFormController
                                      .validateProductPrice,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).categoryTitle,
                                      style: AppTextStyles.h2.copyWith(
                                          color: AppColors.mainBlueColor),
                                    ),
                                    Observer(builder: (_) {
                                      return DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            suffixIconColor:
                                                AppColors.mainBlueColor,
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        AppColors.mainBlueColor,
                                                    width: 2))),
                                        validator: productFormController
                                            .validateProductType,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        borderRadius: BorderRadius.circular(10),
                                        focusColor: AppColors.white,
                                        isExpanded: true,
                                        style: AppTextStyles.h2.copyWith(
                                            overflow: TextOverflow.ellipsis),
                                        items: ProductEnum.values
                                            .where((ProductEnum productEnum) =>
                                                productEnum != ProductEnum.ALL)
                                            .map((productEnum) {
                                          return DropdownMenuItem<String>(
                                              value: productEnum.name,
                                              child: Text(
                                                  productEnum.name.toString()));
                                        }).toList(),
                                        value: productFormController
                                            .productType?.name,
                                        onChanged: (value) =>
                                            productFormController
                                                .setProductType(value!),
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
                            onChanged: (value) => productFormController
                                .setProductDescription(value),
                            initialValue:
                                productFormController.productDescription,
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
                                      value: productFormController
                                          .productAvailability,
                                      onChanged: (value) =>
                                          productFormController
                                              .setProductAvailability(value),
                                      activeColor: AppColors.mainBlueColor,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(builder: ((context) {
                            return TextButton(
                                style: ButtonStyle(
                                    backgroundColor: productFormController
                                            .wasProductFormChanged(
                                                widget.product)
                                        ? MaterialStateProperty.all<Color>(
                                            AppColors.backgroundColor)
                                        : MaterialStateProperty.all<Color>(
                                            AppColors.letterColor
                                                .withOpacity(0.1)),
                                    side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      return BorderSide(
                                          color: AppColors.mainBlueColor);
                                    })),
                                onPressed: productFormController
                                        .wasProductFormChanged(widget.product)
                                    ? () {
                                        if (_formKey.currentState!.validate()) {
                                          widget.product != null
                                              ? productFormController
                                                  .updateProduct(
                                                      widget.restaurant,
                                                      widget.product!.id!)
                                                  .then((value) {
                                                  if (productFormController
                                                          .state
                                                      is ProductFormSuccessState) {
                                                    Modular.to.pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor: AppColors
                                                          .mainBlueColor,
                                                      content: Text(
                                                          widget.snackBarText,
                                                          style: AppTextStyles
                                                              .h2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white)),
                                                    ));
                                                  }
                                                  if (productFormController
                                                          .state
                                                      is ProductFormFailureState) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor: AppColors
                                                          .mainBlueColor,
                                                      content: Text(
                                                          widget.snackBarText,
                                                          style: AppTextStyles
                                                              .h2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white)),
                                                    ));
                                                  }
                                                })
                                              : productFormController
                                                  .createProduct(
                                                      widget.restaurant)
                                                  .then((value) {
                                                  if (productFormController
                                                          .state
                                                      is ProductFormSuccessState) {
                                                    Modular.to.pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor: AppColors
                                                          .mainBlueColor,
                                                      content: Text(
                                                          widget.snackBarText,
                                                          style: AppTextStyles
                                                              .h2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white)),
                                                    ));
                                                  }
                                                  if (productFormController
                                                          .state
                                                      is ProductFormFailureState) {
                                                    var state =
                                                        productFormController
                                                                .state
                                                            as ProductFormFailureState;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      backgroundColor:
                                                          AppColors.errorColor,
                                                      content: Text(
                                                          state.failure.message,
                                                          style: AppTextStyles
                                                              .h2
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .white)),
                                                    ));
                                                  }
                                                });
                                        }
                                      }
                                    : null,
                                child: Text(
                                  widget.buttonText,
                                  style: AppTextStyles.h1.copyWith(
                                      color: AppColors.mainBlueColor,
                                      fontSize: 16),
                                ));
                          }))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]);
          })),
    );
  }
}
