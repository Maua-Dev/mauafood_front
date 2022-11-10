import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauafood_front/app/modules/cart/presenter/bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  final CartBloc bloc;
  const CartPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: bloc,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadedState) {
              return state.cartItems.isEmpty
                  ? Container()
                  : ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Text(state.cartItems[index].meal.name),
                          Text(state.cartItems[index].quantity.toString()),
                        ],
                      ),
                    );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
