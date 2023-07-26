// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/button_widget.dart';
import 'package:mauafood_front/app/shared/widgets/filter_button_widget.dart';

import '../../../generated/l10n.dart';
import '../themes/app_colors.dart';

class FilterSheetWidget extends StatelessWidget {
  final bool isMaxPriceSearch;
  final bool isMinPriceSearch;
  final Function(bool) setIsMaxPriceSearch;
  final Function(bool) setIsMinPriceSearch;
  final RangeValues rangeValues;
  final Function(RangeValues) setRangeValues;
  final double maxValue;
  final Function() filterProduct;
  final Function() filterClean;
  final List<Product> listAllProduct;
  final Function(int) setIndex;
  final Function(ProductEnum) setProductType;
  final int productIndex;
  const FilterSheetWidget({
    Key? key,
    required this.isMaxPriceSearch,
    required this.isMinPriceSearch,
    required this.setIsMaxPriceSearch,
    required this.setIsMinPriceSearch,
    required this.rangeValues,
    required this.setRangeValues,
    required this.maxValue,
    required this.filterProduct,
    required this.filterClean,
    required this.listAllProduct,
    required this.setIndex,
    required this.setProductType,
    required this.productIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listTypesProducts = [
      ProductEnum.ALL,
      ...listAllProduct.map((e) => e.type).toSet().toList()
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 35.0,
              maxHeight: 50,
            ),
            child: ListView.builder(
              itemCount: listTypesProducts.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FilterButtonWidget(
                  text: listTypesProducts[index].name,
                  selected: productIndex == index,
                  onPressed: () {
                    setProductType(listTypesProducts[index]);
                    setIndex(index);
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Checkbox(
              side: BorderSide(color: AppColors.mainBlueColor, width: 2),
              activeColor: AppColors.mainBlueColor,
              value: isMaxPriceSearch,
              onChanged: (value) {
                setIsMaxPriceSearch(value!);
                setIsMinPriceSearch(false);
              },
            ),
            Text(S.of(context).biggestPriceTitle,
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Checkbox(
              side: BorderSide(color: AppColors.mainBlueColor, width: 2),
              activeColor: AppColors.mainBlueColor,
              value: isMinPriceSearch,
              onChanged: (value) {
                setIsMinPriceSearch(value!);
                setIsMaxPriceSearch(false);
              },
            ),
            Text(S.of(context).lowestPriceTitle,
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold))
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              RangeSlider(
                activeColor: AppColors.mainBlueColor,
                values: rangeValues,
                max: maxValue,
                divisions: maxValue.round(),
                labels: RangeLabels(
                  "R\$ ${rangeValues.start.round().toString()}",
                  "R\$ ${rangeValues.end.round().toString()}",
                ),
                onChanged: (RangeValues values) {
                  setRangeValues(values);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ 0",
                    style: AppTextStyles.h2Highlight,
                  ),
                  Text(
                    "R\$ ${maxValue.round().toString()}",
                    style: AppTextStyles.h2Highlight,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ButtonWidget(
            title: S.of(context).applyTitle,
            onPressed: () {
              filterProduct();
              Modular.to.pop();
            },
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextButton(
            onPressed: () {
              filterClean();
              Modular.to.pop();
            },
            child: Text(S.of(context).cleanFilterTitle,
                style: AppTextStyles.h1.copyWith(fontSize: 14)),
          ),
        )
      ],
    );
  }
}
