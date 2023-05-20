import 'package:flutter/material.dart';

class CheckboxFieldLoginWidget extends StatelessWidget {
  final Widget title;
  final bool value;
  final Function(bool)? onChanged;
  const CheckboxFieldLoginWidget({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
