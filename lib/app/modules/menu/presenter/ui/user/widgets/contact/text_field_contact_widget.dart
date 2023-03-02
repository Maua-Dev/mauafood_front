import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

class TextFieldContactWidget extends StatelessWidget {
  final TextFieldBloc textFieldBloc;
  final String title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final SuffixButton? suffixButton;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldContactWidget(
      {super.key,
      required this.textFieldBloc,
      required this.title,
      this.keyboardType,
      this.autoFillHints,
      this.suffixButton,
      this.hintText,
      this.inputFormatters,
      required String? Function(String? value) validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.h2,
        ),
        TextFieldBlocBuilder(
          textAlign: TextAlign.start,
          textFieldBloc: textFieldBloc,
          expands: false,
          keyboardType: TextInputType.text,
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
      ],
    );
  }
}
