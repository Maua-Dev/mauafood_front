import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final TextFieldBloc textFieldBloc;
  final String title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final SuffixButton? suffixButton;
  final String? hintText;

  const TextFieldLoginWidget({
    super.key,
    required this.textFieldBloc,
    required this.title,
    this.keyboardType,
    this.autoFillHints,
    this.suffixButton,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2,
        ),
        TextFieldBlocBuilder(
          textAlign: TextAlign.start,
          textFieldBloc: textFieldBloc,
          keyboardType: keyboardType ?? TextInputType.emailAddress,
          suffixButton: suffixButton,
          autofillHints: autoFillHints ??
              const [
                AutofillHints.email,
              ],
          cursorColor: AppColors.buttonsColor,
          textStyle: AppTextStyles.h2,
          decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.buttonsColor, width: 2))),
        ),
      ],
    );
  }
}
