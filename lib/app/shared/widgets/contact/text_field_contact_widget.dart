import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mauafood_front/app/shared/helpers/utils/screen_helper.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class TextFieldContactWidget extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final int? maxLines;
  const TextFieldContactWidget(
      {super.key,
      required this.title,
      this.keyboardType,
      this.autoFillHints,
      this.hintText,
      this.inputFormatters,
      this.validator,
      this.onChanged,
      this.suffixIcon,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHelper.width(context) * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          onChanged: onChanged,
          autofocus: true,
          maxLines: maxLines,
          textAlign: TextAlign.start,
          expands: false,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.mainBlueColor,
          style: AppTextStyles.h2,
          validator: validator,
          decoration: InputDecoration(
              fillColor: Colors.transparent,
              suffixIcon: suffixIcon,
              labelText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIconColor: AppColors.mainBlueColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: OutlineInputBorder(
                  gapPadding: 2,
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: AppColors.mainBlueColor))),
        ),
      ),
    );
  }
}
