import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';

class MealInfoPage extends StatelessWidget {
  final Meal mealInfo;
  const MealInfoPage({super.key, required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    mealInfo.photo,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealInfo.name,
                        style: AppTextStyles.h1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).mealPriceCurrency(mealInfo.price),
                            style: AppTextStyles.h1.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        mealInfo.description,
                        style: AppTextStyles.h3
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
