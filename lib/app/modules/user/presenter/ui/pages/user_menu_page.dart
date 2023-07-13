import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../shared/helpers/errors/errors.dart';
import '../../controllers/menu/user_menu_restaurant_controller.dart';
import '../../../../../shared/widgets/error_loading_menu_widget.dart';
import '../../../../../shared/widgets/filter_button_widget.dart';
import '../widgets/contact/contact_dialog.dart';
import '../widgets/product_card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserMenuPage extends StatelessWidget {
  const UserMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var menuController = Modular.get<UserMenuRestaurantController>();
    Widget buildError(Failure failure) {
      return ErrorLoadingMenuWidget(
        errorMessage: failure.message,
      );
    }

    Widget buildSuccess(List<Product> listProduct) {
      return Expanded(
          child: RefreshIndicator(
        backgroundColor: AppColors.white,
        color: AppColors.mainBlueColor,
        strokeWidth: 3,
        onRefresh: () async {
          menuController.loadRestaurantMenu();
        },
        child: listProduct.isEmpty
            ? Center(
                child: Text(S.of(context).errorItemNotFound,
                    style: AppTextStyles.h2))
            : ListView.builder(
                itemCount: listProduct.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                itemBuilder: (context, index) {
                  var recommendedProductList = <Product>[];
                  switch (listProduct.length) {
                    case 0:
                      recommendedProductList = [];
                      break;
                    case 1:
                      recommendedProductList = [listProduct[0]];
                      break;
                    case 2:
                      recommendedProductList = [listProduct[0], listProduct[1]];
                      break;
                    default:
                      recommendedProductList = [
                        listProduct[0],
                        listProduct[1],
                        listProduct[2]
                      ];
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProductCardWidget(
                      product: listProduct[index],
                      onPressed: () {
                        Modular.to.pushNamed('/user/product-info', arguments: [
                          listProduct[index],
                          recommendedProductList
                        ]);
                      },
                    ),
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
                        Modular.dispose<UserMenuRestaurantController>();
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
                      S.of(context).restaurantTitle(
                          '', menuController.restaurantInfo.restaurantName),
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
                    child: TextFormField(
                      onChanged: (value) {
                        menuController.searchProduct(value);
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
                            child: state is UserMenuLoadedSuccessState
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
                                        itemCount: ProductEnum.values.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return FilterButtonWidget(
                                            myIndex: index,
                                            actualIndex: state.index,
                                            onPressed: () {
                                              menuController.filterProduct(
                                                  ProductEnum.values[index]);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink()),
                        state is UserMenuLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : state is UserMenuLoadedSuccessState
                                ? buildSuccess(state.listProduct)
                                : state is UserMenuErrorState
                                    ? buildError(state.failure)
                                    : const SizedBox.shrink(),
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