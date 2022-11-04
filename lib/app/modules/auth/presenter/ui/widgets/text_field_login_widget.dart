import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final TextFieldBloc textFieldBloc;
  final String title;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final SuffixButton? suffixButton;

  const TextFieldLoginWidget({
    super.key,
    required this.textFieldBloc,
    required this.title,
    this.keyboardType,
    this.autoFillHints,
    this.suffixButton,
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
          textFieldBloc: textFieldBloc,
          keyboardType: keyboardType ?? TextInputType.emailAddress,
          suffixButton: suffixButton,
          autofillHints: autoFillHints ??
              const [
                AutofillHints.email,
              ],
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
