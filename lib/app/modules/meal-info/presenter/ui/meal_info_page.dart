import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/bloc/demand_bloc.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../cart/infra/models/cart_item_model.dart';
import '../../../cart/presenter/bloc/cart_bloc.dart';

class MealInfoPage extends StatelessWidget {
  final MealModel mealInfo;
  final CartBloc bloc;
  const MealInfoPage({
    super.key,
    required this.mealInfo,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => Modular.get<DemandBloc>()
                ..add(LoadEvent(
                    item: CartItemModel(meal: mealInfo, quantity: 0)))),
        ],
        child: Material(
          elevation: 10,
          child: SizedBox(
            width: Utils.width(context),
            height: Utils.height(context) / 5,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Utils.width(context) / 18),
              child: BlocBuilder<DemandBloc, DemandState>(
                builder: (context, state) {
                  if (state is DemandLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is DemandLoadedState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: state.item.quantity == 0
                                  ? null
                                  : () {
                                      if (state.item.quantity > 0) {
                                        BlocProvider.of<DemandBloc>(context)
                                            .add(RemoveQuantityEvent(
                                                item: state.item));
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12),
                                backgroundColor: AppColors.white,
                                elevation: 10,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: AppColors.buttonsColor,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                state.item.quantity.toString(),
                                style: AppTextStyles.h2.copyWith(fontSize: 22),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (state.item.quantity >= 0) {
                                  BlocProvider.of<DemandBloc>(context)
                                      .add(AddQuantityEvent(item: state.item));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(12),
                                backgroundColor: AppColors.white,
                                elevation: 10,
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColors.buttonsColor,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: state.item.quantity == 0
                              ? null
                              : () {
                                  bloc.add(AddItemEvent(item: state.item));
                                  Modular.to.pop();
                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonsColor,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: Text(
                            'Adicionar',
                            style: AppTextStyles.h2
                                .copyWith(color: AppColors.white, fontSize: 22),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: Utils.width(context),
                  height: 300,
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
                  child: ElevatedButton(
                    onPressed: () {
                      Modular.to.pop('/menu');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.letterHighlightThinColor,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealInfo.name,
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${mealInfo.price.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: AppTextStyles.h1,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColors.letterHighlightColor,
                          ),
                          Text(
                            '${mealInfo.prepareTime} min',
                            style: AppTextStyles.h2Highlight,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    mealInfo.description,
                    style: AppTextStyles.h2Thin,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    'Recomendados',
                    style: AppTextStyles.h1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RecommendationCardWidget(
                      mealInfo: mealInfo,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Utils.height(context) / 5,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
