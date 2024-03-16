import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:like_button/like_button.dart';

import 'package:mauafood_front/app/modules/profile/presenter/controllers/favorites_controller.dart';
import 'package:mauafood_front/app/shared/helpers/services/s3/assets_s3.dart';
import 'package:mauafood_front/app/shared/helpers/services/snackbar/global_snackbar.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/app/shared/widgets/like_button_custom.dart';
import 'package:shimmer/shimmer.dart';

import '../../states/favorite_state.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesController store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.mainBlueColor,
        ),
        title: Text('Favoritos',
            style: AppTextStyles.h1.copyWith(color: AppColors.mainBlueColor)),
        backgroundColor: AppColors.backgroundColor2,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundColor2,
      body: Observer(builder: (context) {
        if (store.state is LoadingFavoriteState) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 20,
                            width: 200,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            height: 20,
                            width: 200,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const LikeButton()
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (store.state is ErrorFavoriteState) {
          GlobalSnackBar.error((store.state as ErrorFavoriteState).message);
        }
        final list = (store.state as SuccessFavoriteState).products;
        if (list.isEmpty) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  greyLogo,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'Não há favoritos ainda!',
                style: AppTextStyles.h2,
              ),
            ],
          );
        }
        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            final item = list[index];
            return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        imageUrl: item.photo ?? '',
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      SizedBox(
                        width: ScreenHelper.width(context) * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              item.restaurant,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      LikeButtonCustom(
                        isFavorite: true,
                        onFavoritePressed: (value) async {
                          final res = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog.adaptive(
                                title:
                                    const Text('Deseja remover dos favoritos?'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Modular.to.pop(false),
                                      child: const Text('Não')),
                                  TextButton(
                                      onPressed: () => Modular.to.pop(true),
                                      child: const Text('Sim'))
                                ]),
                          );

                          if (res ?? false) {
                            return store.removeFavorite(item);
                          }
                          return true;
                        },
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        );
      }),
    );
  }
}
