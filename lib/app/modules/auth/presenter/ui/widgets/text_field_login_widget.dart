import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final TextFieldBloc textFieldBloc;
  final String? title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final SuffixButton? suffixButton;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldLoginWidget({
    super.key,
    required this.textFieldBloc,
    this.title,
    this.keyboardType,
    this.autoFillHints,
    this.suffixButton,
    this.hintText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: AppTextStyles.h2,
              )
            : const SizedBox.shrink(),
        TextFieldBlocBuilder(
          inputFormatters: inputFormatters,
          textAlign: TextAlign.start,
          textFieldBloc: textFieldBloc,
          keyboardType: keyboardType ?? TextInputType.emailAddress,
          suffixButton: suffixButton,
          autofillHints: autoFillHints ??
              const [
                AutofillHints.email,
              ],
          cursorColor: AppColors.mainBlueColor,
          textStyle: AppTextStyles.h2,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: hintText,
              suffixIconColor: AppColors.mainBlueColor,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.mainBlueColor, width: 2))),
        ),
        // const SizedBox(
        //   height: 8,
        // ),
      ],
    );
  }
}
