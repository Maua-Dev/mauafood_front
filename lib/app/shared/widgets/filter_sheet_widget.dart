import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/button_widget.dart';

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
  final Function() filterProductsByPrice;
  final Function() filterClean;
  const FilterSheetWidget(
      {super.key,
      required this.rangeValues,
      required this.isMaxPriceSearch,
      required this.isMinPriceSearch,
      required this.setIsMaxPriceSearch,
      required this.setIsMinPriceSearch,
      required this.setRangeValues,
      required this.maxValue,
      required this.filterProductsByPrice,
      required this.filterClean});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                      style: AppTextStyles.h2
                          .copyWith(fontWeight: FontWeight.bold))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                      style: AppTextStyles.h2
                          .copyWith(fontWeight: FontWeight.bold))
                ]),
              ],
            ),
          ),
          Column(
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
          const SizedBox(height: 32),
          ButtonWidget(
            title: S.of(context).applyTitle,
            onPressed: () {
              filterProductsByPrice();
              Modular.to.pop();
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              filterClean();
              Modular.to.pop();
            },
            child: Text(S.of(context).cleanFilterTitle,
                style: AppTextStyles.h1.copyWith(fontSize: 14)),
          )
        ],
      ),
    );
  }
}
