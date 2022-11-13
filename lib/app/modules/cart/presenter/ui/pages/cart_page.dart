import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../../../../shared/utils/utils.dart';
import '../../../../menu/presenter/ui/widgets/error_loading_menu_widget.dart';
import '../widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  final CartBloc bloc;
  const CartPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider.value(
          value: bloc,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60,
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
                    Text(
                      'Carrinho',
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor2,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: Utils.width(context),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadedState) {
                        return state.cartItems.isEmpty
                            ? const ErrorLoadingMenuWidget(
                                errorMessage: 'Carrinho está vazio.',
                              )
                            : ListView.builder(
                                itemCount: state.cartItems.length,
                                itemBuilder: (context, index) => CartItemWidget(
                                      item: state.cartItems[index],
                                    ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
