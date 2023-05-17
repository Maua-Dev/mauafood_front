import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

class TextFieldContactWidget extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const TextFieldContactWidget(
      {super.key,
      required this.title,
      this.keyboardType,
      this.autoFillHints,
      this.hintText,
      this.inputFormatters,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.h2,
          ),
          TextFormField(
            autofocus: false,
            maxLines: null,
            textAlign: TextAlign.start,
            expands: false,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.mainBlueColor,
            style: AppTextStyles.h2,
            validator: validator,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: hintText,
                suffixIconColor: AppColors.mainBlueColor,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.mainBlueColor, width: 2))),
          ),
        ],
      ),
    );
  }
}
