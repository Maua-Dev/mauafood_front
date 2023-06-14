import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/employee/widgets/new_product_dialog_widget.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/domain/enums/product_enum.dart';
import '../../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../controllers/menu/menu_restaurant_controller.dart';
import '../../../states/menu_state.dart';
import '../../user/widgets/error_loading_menu_widget.dart';
import '../../user/widgets/filter_button_widget.dart';
import '../widgets/product_card_employee_widget.dart';

class EmployeeMenuPage extends StatelessWidget {
  final RestaurantEnum restaurant;
  const EmployeeMenuPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var menuController = Modular.get<MenuRestaurantController>();
    return Scaffold(
      backgroundColor: AppColors.mainBlueColor,
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        title: SizedBox(
          child: Image.network(
            whiteLogo,
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: AppColors.mainBlueColor,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
            )),
        width: double.infinity,
        child: Observer(builder: (_) {
          var state = menuController.state;
          return Padding(
            padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      restaurant.name,
                      style: AppTextStyles.h1
                          .copyWith(color: AppColors.mainBlueColor),
                    ),
                    IconButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext buildContext) {
                              return const NewProductDialogWidget();
                            }),
                        icon: Icon(
                          Icons.add_circle_sharp,
                          color: AppColors.mainBlueColor,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TextField(
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
                ),
                state is MenuLoadedSuccessState
                    ? ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 35.0,
                          maxHeight: 50,
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
                                menuController
                                    .filterProduct(ProductEnum.values[index]);
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
                              menuController.loadRestaurantMenu();
                            },
                            child: ListView.builder(
                              itemCount: state.listProduct.length,
                              itemBuilder: (context, index) {
                                return ProductCardEmployeeWidget(
                                  product: state.listProduct[index],
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
        }),
      ),
    );
  }
}
