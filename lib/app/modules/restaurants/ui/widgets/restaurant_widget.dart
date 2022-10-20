import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class RestaurantWidget extends StatelessWidget {
  final String photoLink;
  final String name;
  const RestaurantWidget({
    Key? key,
    required this.name,
    required this.photoLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 150,
                child: Image.network(
                  photoLink,
                  fit: BoxFit.fill,
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
                )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  name,
                  style: AppTextStyles.h1,
                ),
              ),
              SizedBox(
                  height: 60,
                  width: 220,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), //a borda nao esta ficando arredondada
                          ),
                          backgroundColor: AppColors.backgroundColor),
                      onPressed: () {},
                      child: Text(
                        "Ver cardápio",
                        style: AppTextStyles.h2HighlightBold,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
