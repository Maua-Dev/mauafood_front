import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/cart/infra/models/cart_item_model.dart';
import 'package:mauafood_front/app/modules/meal-info/presenter/ui/widgets/meal_list_view_widget.dart';
import 'package:mauafood_front/app/modules/menu/infra/models/meal_model.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../cart/presenter/bloc/cart_bloc.dart';
import '../../../cart/presenter/ui/widgets/quantity_item_widget.dart';

class MealInfoPage extends StatefulWidget {
  final MealModel mealInfo;
  final CartBloc bloc;
  const MealInfoPage({
    super.key,
    required this.mealInfo,
    required this.bloc,
  });

  @override
  State<MealInfoPage> createState() => _MealInfoPageState();
}

class _MealInfoPageState extends State<MealInfoPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => widget.bloc),
          ],
          child: Material(
            elevation: 10,
            child: SizedBox(
              width: Utils.width(context),
              height: Utils.height(context) / 5,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.width(context) / 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityItemWidget(
                      quantity: quantity.toString(),
                      addQuantity: () {
                        if (quantity >= 0) {
                          setState(() {
                            quantity++;
                          });
                        }
                      },
                      removeQuantity: quantity == 0
                          ? null
                          : () {
                              if (quantity > 0) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                    ),
                    ElevatedButton(
                      onPressed: quantity == 0
                          ? null
                          : () {
                              widget.bloc.add(AddItemEvent(
                                  item: CartItemModel(
                                      meal: widget.mealInfo,
                                      quantity: quantity)));
                              Modular.to.pop();
                            },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonsColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        'Adicionar',
                        style: AppTextStyles.h2
                            .copyWith(color: AppColors.white, fontSize: 22),
                      ),
                    )
                  ],
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
                      widget.mealInfo.photo,
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
                          backgroundColor: AppColors.buttonsColor,
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
                      widget.mealInfo.name,
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'R\$ ${widget.mealInfo.price.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: AppTextStyles.h1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      widget.mealInfo.description,
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
                        mealInfo: widget.mealInfo,
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
      ),
    );
  }
}
