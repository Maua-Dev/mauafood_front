import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/appbar/drop_down_restaurant_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/filter_button_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/meal_card_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../domain/enum/meal_enum.dart';
import '../widgets/error_loading_menu_widget.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Modular.get<MenuBloc>()..add(GetAllMealsEvent()),
        child: Column(
          children: [
            BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropDownRestaurantWidget(
                    restaurant:
                        BlocProvider.of<MenuBloc>(context).restaurantInfo,
                  ),
                );
              },
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 35.0,
                maxHeight: 100,
              ),
              child:
                  BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: TextField(
                    onChanged: (value) {
                      BlocProvider.of<MenuBloc>(context)
                          .add(SearchMealEvent(search: value));
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: AppColors.backgroundColor2), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelStyle: AppTextStyles.h2Highlight
                          .copyWith(fontWeight: FontWeight.bold),
                      labelText: 'Pesquisa',
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.letterHighlightColor,
                      ),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor2,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
                      if (state is MenuLoadedSuccessState) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 35.0,
                            maxHeight: 50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView.builder(
                              itemCount: MealEnum.values.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FilterButtonWidget(
                                  myIndex: index,
                                  blocIndex: state.index,
                                  onPressed: MealEnum.values[index] ==
                                          MealEnum.tudo
                                      ? () {
                                          BlocProvider.of<MenuBloc>(context)
                                              .add(GetAllMealsEvent());
                                        }
                                      : () {
                                          BlocProvider.of<MenuBloc>(context)
                                              .add(FilterMealTypeEvent(
                                                  mealType:
                                                      MealEnum.values[index]));
                                        },
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        if (state is MenuLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is MenuLoadedSuccessState) {
                          return Expanded(
                            child: RefreshIndicator(
                              backgroundColor: AppColors.white,
                              color: AppColors.letterHighlightColor,
                              strokeWidth: 3,
                              onRefresh: () async {
                                BlocProvider.of<MenuBloc>(context)
                                    .add(GetAllMealsEvent());
                              },
                              child: GridView.builder(
                                itemCount: state.listMeal.length,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  maxCrossAxisExtent: 210,
                                ),
                                itemBuilder: (context, index) {
                                  return MealCardWidget(
                                    meal: state.listMeal[index],
                                  );
                                },
                              ),
                            );
                          }
                          if (state is MenuErrorState) {
                            return ErrorLoadingMenuWidget(
                              errorMessage: state.failure.message,
                            );
                          } else {
                            return const Text('Something went wrong!');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
