import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/cart/presenter/ui/widgets/quantity_item_widget.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/utils/utils.dart';
import '../../../infra/models/cart_item_model.dart';
import '../../bloc/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double price = item.meal.price * item.quantity;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Utils.width(context) / 4,
                child: Image.network(
                  item.meal.photo,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.meal.name,
                      style: AppTextStyles.h2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        QuantityItemWidget(
                          quantity: item.quantity.toString(),
                          addQuantity: () {
                            Modular.get<CartBloc>().add(UpdateItemEvent(
                                item: item.copyWith(
                                    quantity: item.quantity + 1)));
                          },
                          removeQuantity: () {
                            item.quantity == 1
                                ? showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Deseja excluir item do carrinho?'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Modular.to.pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.buttonsColor,
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                            child: const Text('Não'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Modular.get<CartBloc>().add(
                                                  DeleteItemEvent(id: item.id));
                                              Modular.to.pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.buttonsColor,
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                            child: const Text('Sim'),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : Modular.get<CartBloc>().add(UpdateItemEvent(
                                    item: item.copyWith(
                                        quantity: item.quantity - 1)));
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'R\$${price.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
