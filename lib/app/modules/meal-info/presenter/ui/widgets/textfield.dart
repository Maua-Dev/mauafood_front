import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class TextFieldObservation extends StatelessWidget {
  const TextFieldObservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.buttonsColor, width: 2),
          ),
          labelText: 'Observações',
        ),
      ),
    );
  }
}
