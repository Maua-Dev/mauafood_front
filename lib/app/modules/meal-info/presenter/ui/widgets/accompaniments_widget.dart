import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class AccompanimentsWidget extends StatefulWidget {
  const AccompanimentsWidget({super.key, required this.mealInfo});

  final MealModel mealInfo;

  @override
  State<AccompanimentsWidget> createState() => _AccompanimentsWidgetState();
}

class _AccompanimentsWidgetState extends State<AccompanimentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: double.infinity,
          color: AppColors.backgroundColor3,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Escolha os acompanhamentos',
                    style: AppTextStyles.h2Thin.copyWith(
                        color: const Color.fromARGB(255, 73, 70, 70),
                        fontSize: 16)),
                Text('0 a 2',
                    style: AppTextStyles.h2Thin.copyWith(
                        color: const Color.fromARGB(255, 73, 70, 70),
                        fontSize: 16)),
              ],
            ),
          ),
        ),
        InkWell(
          mouseCursor: MouseCursor.defer,
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                const Text('Mostarda'),
                const Spacer(),
                Image.network(
                  widget.mealInfo.photo,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(
                    Icons.circle_outlined,
                    color: AppColors.buttonsColor,
                  ),
                  onPressed: () {},
                ),
              ])),
        ),
        InkWell(
          mouseCursor: MouseCursor.defer,
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                const Text('Ketchup'),
                const Spacer(),
                Image.network(
                  widget.mealInfo.photo,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_outlined,
                      color: AppColors.buttonsColor,
                    ))
              ])),
        ),
        const SizedBox(height: 16),
        Container(
          height: 56,
          width: double.infinity,
          color: AppColors.backgroundColor3,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Escolha o acompanhamento',
                    style: AppTextStyles.h2Thin.copyWith(
                        color: const Color.fromARGB(255, 73, 70, 70),
                        fontSize: 16)),
                Text('0 a 1',
                    style: AppTextStyles.h2Thin.copyWith(
                        color: const Color.fromARGB(255, 73, 70, 70),
                        fontSize: 16)),
              ],
            ),
          ),
        ),
        InkWell(
          mouseCursor: MouseCursor.defer,
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                const Text('Alface'),
                const Spacer(),
                Image.network(
                  widget.mealInfo.photo,
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_outlined,
                      color: AppColors.buttonsColor,
                    ))
              ])),
        ),
      ],
    );
  }
}
