import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/widgets/product_form_dialog_widget.dart';
import 'package:mauafood_front/app/shared/widgets/confirm_dialog_widget.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../shared/widgets/circular_progress_indicator_custom_widget.dart';
import '../../../../../../shared/domain/entities/product.dart';

class ProductCardEmployeeWidget extends StatelessWidget {
  final Product product;
  const ProductCardEmployeeWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenHelper.width(context) / 3.5,
                      height: ScreenHelper.width(context) / 3.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            product.photo,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircularProgressIndicatorCustomWidget(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: ((context) =>
                                            ProductFormDialogWidget(
                                              product: product,
                                            )));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: AppColors.mainBlueColor,
                                    size: 24,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext buildContext) {
                                          return ConfirmationDialogWidget(
                                            cancellationText:
                                                S.of(context).cancelationTitle,
                                            dialogContent: S
                                                .of(context)
                                                .deleteProductConfirmationTitle,
                                            confirmationText:
                                                S.of(context).deleteTitle,
                                            onConfirmation: () {
                                              Modular.to.pop();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    S
                                                        .of(context)
                                                        .productSuccessfullyDeletedTitle,
                                                    style: AppTextStyles.h2
                                                        .copyWith(
                                                            color: AppColors
                                                                .white)),
                                              ));
                                            },
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.mainBlueColor,
                                    size: 24,
                                  ))
                            ],
                          ),
                          Text(
                            overflow: TextOverflow.clip,
                            product.name,
                            style: AppTextStyles.h1.copyWith(
                                fontSize: 20, color: AppColors.mainBlueColor),
                          ),
                          product.description == ''
                              ? const SizedBox(
                                  height: 16,
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    product.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.h2.copyWith(
                                        color: AppColors.mainBlueColor),
                                  ),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S
                                    .of(context)
                                    .productPriceCurrency(product.price),
                                style: AppTextStyles.h2.copyWith(
                                    fontSize: 18,
                                    color: AppColors.mainBlueColor),
                              ),
                              product.prepareTime == null
                                  ? const SizedBox.shrink()
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.timer_sharp,
                                          color: AppColors.mainBlueColor,
                                          size: 24,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          S
                                              .of(context)
                                              .productPrepareTimeMinutes(
                                                  '',
                                                  product.prepareTime
                                                      .toString()),
                                          style: AppTextStyles.h2.copyWith(
                                              fontSize: 18,
                                              color: AppColors.mainBlueColor),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
