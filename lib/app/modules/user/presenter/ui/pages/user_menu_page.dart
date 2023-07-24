import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/user_menu_state.dart';
import 'package:mauafood_front/app/modules/user/presenter/controllers/menu/user_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/user/presenter/ui/widgets/contact/contact_dialog.dart';
import 'package:mauafood_front/app/shared/domain/entities/product.dart';
import 'package:mauafood_front/app/shared/domain/enums/product_enum.dart';
import 'package:mauafood_front/app/shared/domain/enums/restaurant_enum.dart';
import 'package:mauafood_front/app/shared/helpers/errors/errors.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/error_loading_menu_widget.dart';
import 'package:mauafood_front/app/shared/widgets/filter_button_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import '../widgets/product_card_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserMenuPage extends StatefulWidget {
  const UserMenuPage({super.key});

  @override
  State<UserMenuPage> createState() => _UserMenuPageState();
}

class _UserMenuPageState extends State<UserMenuPage> {
  final UserMenuRestaurantController store = Modular.get();

  @override
  Widget build(BuildContext context) {
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
          store.loadRestaurantMenu();
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProductCardWidget(
                      product: listProduct[index],
                      onPressed: () {
                        Modular.to.pushNamed('/user/product-info/', arguments: [
                          listProduct[index],
                          listProduct
                              .where((element) =>
                                  element.type == listProduct[index].type)
                              .toList()
                        ]);
                      },
                    ),
                  );
                },
              ),
      ));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainBlueColor,
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const ContactDialog());
        },
        child: const Icon(Icons.mail),
      ),
      body: SafeArea(
        bottom: false,
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
                    S.of(context).restaurantTitle(
                        '', store.restaurantInfo.restaurantName),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: TextFormField(
                    onChanged: (value) {
                      store.searchProduct(value);
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
              var listTypesProducts = [
                ProductEnum.ALL,
                ...store.listAllProduct.map((e) => e.type).toSet().toList()
              ];
              var state = store.state;
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
                          padding: const EdgeInsets.only(top: 24),
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
                                      itemCount: listTypesProducts.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return FilterButtonWidget(
                                          text: listTypesProducts[index].name,
                                          selected: state.index == index,
                                          onPressed: () {
                                            store.filterProduct(
                                                listTypesProducts[index],
                                                index);
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
    );
  }
}