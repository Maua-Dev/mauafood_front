import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../restaurants/domain/infra/restaurant_enum.dart';
import '../../../../domain/enum/meal_enum.dart';
import '../../../bloc/menu_bloc.dart';
import '../../user/widgets/error_loading_menu_widget.dart';
import '../../user/widgets/filter_button_widget.dart';
import '../widgets/meal_card_employee_widget.dart';

class EmployeeMenuPage extends StatelessWidget {
  final RestaurantEnum restaurant;
  const EmployeeMenuPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        title: SizedBox(
          child: Image.asset(
            'assets/images/logos/white_logo.png',
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: AppColors.mainBlueColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
          create: (context) => Modular.get<MenuBloc>()..add(GetAllMealsEvent()),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.backgroundColor2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                )),
            width: double.infinity,
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
                  child: Column(
                    children: [
                      Text(
                        restaurant.name,
                        style: AppTextStyles.h1
                            .copyWith(color: AppColors.mainBlueColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
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
                                  color: AppColors
                                      .backgroundColor2), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      AppColors.mainBlueColor), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            labelStyle: AppTextStyles.h2Highlight
                                .copyWith(fontWeight: FontWeight.bold),
                            labelText: S.of(context).searchTitle,
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.mainBlueColor,
                            ),
                          ),
                        ),
                      ),
                      state is MenuLoadedSuccessState
                          ? ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 35.0,
                                maxHeight: 50,
                              ),
                              child: ListView.builder(
                                itemCount: MealEnum.values.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return FilterButtonWidget(
                                    myIndex: index,
                                    blocIndex: state.index,
                                    onPressed: MealEnum.values[index] ==
                                            MealEnum.TUDO
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
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 12,
                      ),
                      state is MenuLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : state is MenuLoadedSuccessState
                              ? Expanded(
                                  child: RefreshIndicator(
                                  backgroundColor: AppColors.white,
                                  color: AppColors.mainBlueColor,
                                  strokeWidth: 3,
                                  onRefresh: () async {
                                    BlocProvider.of<MenuBloc>(context)
                                        .add(GetAllMealsEvent());
                                  },
                                  child: ListView.builder(
                                    itemCount: state.listMeal.length,
                                    itemBuilder: (context, index) {
                                      return MealCardEmployeeWidget(
                                        meal: state.listMeal[index],
                                      );
                                    },
                                  ),
                                ))
                              : state is MenuErrorState
                                  ? ErrorLoadingMenuWidget(
                                      errorMessage: state.failure.message,
                                    )
                                  : Text(S.of(context).errorGeneric)
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
