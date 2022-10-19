import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/bloc/menu_bloc.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/appbar/menu_appbar_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/filter_button_widget.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/widgets/meal_card_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

import '../../domain/enum/meal_enum.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 54), child: MenuAppbarWidget()),
      body: BlocProvider(
        create: (context) => Modular.get<MenuBloc>()..add(GetAllMealsEvent()),
        child: Column(
          children: [
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
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelStyle:
                        TextStyle(color: AppColors.letterHighlightColor),
                    labelText: 'Pesquisa',
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.letterHighlightColor,
                    ),
                  ),
                ),
              );
            }),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor2,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      if (state is MenuLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is MenuLoadedSuccessState) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 35.0,
                                maxHeight: 50,
                              ),
                              child: ListView.builder(
                                itemCount: MealEnum.values.length,
                                scrollDirection: Axis.horizontal,
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
                                                    mealType: MealEnum
                                                        .values[index]));
                                          },
                                  );
                                },
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 35.0,
                                maxHeight: 500,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: GridView.builder(
                                  itemCount: state.listMeal.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                  ),
                                  itemBuilder: (context, index) {
                                    return MealCardWidget(
                                      name: state.listMeal[index].name,
                                      price: state.listMeal[index].price
                                          .toString()
                                          .replaceAll('.', ','),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Something went wrong!');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
