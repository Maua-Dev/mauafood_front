import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class CheckboxFieldLoginWidget extends StatelessWidget {
  final Widget title;
  final BooleanFieldBloc booleanFieldBloc;
  const CheckboxFieldLoginWidget(
      {super.key, required this.booleanFieldBloc, required this.title});

  @override
  Widget build(BuildContext context) {
    return CheckboxFieldBlocBuilder(
      padding: EdgeInsets.zero,
      booleanFieldBloc: booleanFieldBloc,
      checkColor: MaterialStateProperty.all(AppColors.white),
      fillColor: MaterialStateProperty.all(AppColors.buttonsColor),
      body: title,
    );
  }
}
