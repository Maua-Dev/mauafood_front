import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';
import 'package:mauafood_front/generated/l10n.dart';

import '../../../../../../shared/helpers/services/s3/assets_s3.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../auth/presenter/ui/widgets/button_widget.dart';

class DisclaimerDialog extends StatelessWidget {
  const DisclaimerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.mainBlueColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning,
              color: AppColors.white,
              size: 80,
            ),
            Text(
              S.of(context).attentionTitle.toUpperCase(),
              style: AppTextStyles.h1
                  .copyWith(color: AppColors.white, fontSize: 22),
            )
          ],
        ),
      ),
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      backgroundColor: AppColors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: SizedBox(
              width: double.infinity,
              height: ScreenHelper.height(context) / 7,
              child: Image.network(
                transparentLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            S.of(context).disclaimerText,
            style: AppTextStyles.h2.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          ButtonWidget(
            title: S.of(context).understoodTitle,
            onPressed: () {
              Modular.to.pop();
            },
          )
        ],
      ),
    );
  }
}
