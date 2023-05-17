import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/domain/entities/meal_entity.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/contact/contact_dialog.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../../../../restaurants/domain/infra/restaurant_enum.dart';
import '../../../../domain/enum/meal_enum.dart';
import '../../../../domain/errors/errors.dart';
import '../../../controllers/menu/menu_controller.dart';
import '../../states/menu_state.dart';
import '../widgets/error_loading_menu_widget.dart';
import '../widgets/filter_button_widget.dart';
import '../widgets/meal_card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserMenuPage extends StatelessWidget {
  final RestaurantEnum restaurantInfo;
  const UserMenuPage({super.key, required this.restaurantInfo});

  @override
  Widget build(BuildContext context) {
    var menuController = Modular.get<MenuController>();
    Widget buildError(Failure failure) {
      return ErrorLoadingMenuWidget(
        errorMessage: failure.message,
      );
    }

    Widget buildSuccess(List<Meal> listMeal) {
      return Expanded(
          child: RefreshIndicator(
        backgroundColor: AppColors.white,
        color: AppColors.mainBlueColor,
        strokeWidth: 3,
        onRefresh: () async {
          menuController.loadRestaurantMenu();
        },
        child: listMeal.isEmpty
            ? Center(
                child: Text(S.of(context).errorItemNotFound,
                    style: AppTextStyles.h2))
            : GridView.builder(
                itemCount: listMeal.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  maxCrossAxisExtent: 210,
                ),
                itemBuilder: (context, index) {
                  var recommendedMealList = <Meal>[];
                  switch (listMeal.length) {
                    case 0:
                      recommendedMealList = [];
                      break;
                    case 1:
                      recommendedMealList = [listMeal[0]];
                      break;
                    case 2:
                      recommendedMealList = [listMeal[0], listMeal[1]];
                      break;
                    default:
                      recommendedMealList = [
                        listMeal[0],
                        listMeal[1],
                        listMeal[2]
                      ];
                  }
                  return MealCardWidget(
                    meal: listMeal[index],
                    onPressed: () {
                      Modular.to.pushNamed('/user/meal-info',
                          arguments: [listMeal[index], recommendedMealList]);
                    },
                  );
                },
              ),
      ));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainBlueColor,
          onPressed: () {
            showDialog(
                context: context, builder: (context) => const ContactDialog());
          },
          child: const Icon(Icons.mail),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Modular.to.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainBlueColor,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      S.of(context).restaurantTitle('', restaurantInfo.name),
                      style: AppTextStyles.h1
                          .copyWith(color: AppColors.mainBlueColor),
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 35.0,
                    maxHeight: 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: TextField(
                      onChanged: (value) {
                        menuController.searchMeal(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColors.backgroundColor2), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: AppColors.mainBlueColor), //<-- SEE HERE
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
                  )),
              Observer(builder: (_) {
                var state = menuController.state;
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor2,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 16),
                            child: state is MenuLoadedSuccessState
                                ? ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minHeight: 35.0,
                                      maxHeight: 50,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
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
                                                    MealEnum.ALL
                                                ? () {
                                                    menuController
                                                        .loadRestaurantMenu();
                                                  }
                                                : () {
                                                    menuController.filterMeal(
                                                        MealEnum.values[index]);
                                                  },
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()),
                        state is MenuLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : state is MenuLoadedSuccessState
                                ? buildSuccess(state.listMeal)
                                : state is MenuErrorState
                                    ? ErrorLoadingMenuWidget(
                                        errorMessage: state.failure.message,
                                      )
                                    : Text(S.of(context).errorGeneric),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
