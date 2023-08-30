import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/employee/presenter/controllers/menu/employee_menu_restaurant_controller.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/employee_menu_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/states/product-card/product_card_employee_state.dart';
import 'package:mauafood_front/app/modules/employee/presenter/ui/widgets/product_form_dialog_widget.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/domain/enums/restaurant_enum.dart';
import '../../../../../shared/widgets/error_loading_menu_widget.dart';
import '../../../../../shared/widgets/filter_sheet_widget.dart';
import '../widgets/product_card_employee_widget.dart';

class EmployeeMenuPage extends StatefulWidget {
  final RestaurantEnum restaurant;
  const EmployeeMenuPage({super.key, required this.restaurant});

  @override
  State<EmployeeMenuPage> createState() => _EmployeeMenuPageState();
}

class _EmployeeMenuPageState extends State<EmployeeMenuPage> {
  var store = Modular.get<EmployeeMenuRestaurantController>();
  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              onPressed: store.logout, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
            )),
        width: double.infinity,
        child: Observer(builder: (_) {
          var productCardState = store.productCardState;
          var state = store.state;
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
                      widget.restaurant.restaurantName,
                      style: AppTextStyles.h1
                          .copyWith(color: AppColors.mainBlueColor),
                    ),
                    IconButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext buildContext) {
                              return ProductFormDialogWidget(
                                restaurant: widget.restaurant,
                                title: S.of(context).createProductTitle,
                                buttonText: S.of(context).createTitle,
                                snackBarText: S
                                    .of(context)
                                    .productSuccessfullyCreatedTitle,
                              );
                            }),
                        icon: Icon(
                          Icons.add_circle_sharp,
                          color: AppColors.mainBlueColor,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            store.search = value;
                            store.filterProduct();
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
                      state is EmployeeMenuLoadedSuccessState
                          ? IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    useRootNavigator: true,
                                    useSafeArea: true,
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return Observer(builder: (_) {
                                        return FilterSheetWidget(
                                            setIndex: store.setIndex,
                                            productIndex: store.index,
                                            setProductType:
                                                store.setProductType,
                                            listAllProduct:
                                                store.listAllProduct,
                                            filterClean: store.cleanFilter,
                                            isMaxPriceSearch:
                                                store.isMaxPriceSearch,
                                            isMinPriceSearch:
                                                store.isMinPriceSearch,
                                            setIsMaxPriceSearch:
                                                store.setIsMaxPriceSearch,
                                            setIsMinPriceSearch:
                                                store.setIsMinPriceSearch,
                                            setRangeValues:
                                                store.setRangeValues,
                                            rangeValues: store.rangeValues!,
                                            maxValue: store.listAllProduct
                                                .map((e) => e.price)
                                                .reduce(
                                                    (a, b) => a > b ? a : b),
                                            filterProduct: store.filterProduct);
                                      });
                                    });
                              },
                              icon: const Icon(Icons.filter_alt))
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                state is EmployeeMenuLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : state is EmployeeMenuLoadedSuccessState
                        ? Expanded(
                            child: RefreshIndicator(
                            backgroundColor: AppColors.white,
                            color: AppColors.mainBlueColor,
                            strokeWidth: 3,
                            onRefresh: () async {
                              await store.loadRestaurantMenu();
                              store.filterProduct();
                            },
                            child: ListView.builder(
                              itemCount: state.listProduct.length,
                              itemBuilder: (context, index) {
                                return Observer(builder: (_) {
                                  return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        productCardState
                                                    is ProductCardEmployeeLoadingState &&
                                                productCardState.index == index
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : const SizedBox.shrink(),
                                        AbsorbPointer(
                                          absorbing: productCardState
                                                  is ProductCardEmployeeLoadingState &&
                                              productCardState.index == index,
                                          child: Opacity(
                                            opacity: productCardState
                                                        is ProductCardEmployeeLoadingState &&
                                                    productCardState.index ==
                                                        index
                                                ? 0.5
                                                : 1,
                                            child: ProductCardEmployeeWidget(
                                              index: index,
                                              product: state.listProduct[index],
                                              restaurant: widget.restaurant,
                                            ),
                                          ),
                                        ),
                                      ]);
                                });
                              },
                            ),
                          ))
                        : state is EmployeeMenuErrorState
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
