import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_text_styles.dart';

class TextButtonLoginWidget extends StatelessWidget {
  final Function() onPressed;
  final String? text;
  final String highlightText;
  const TextButtonLoginWidget(
      {super.key,
      required this.onPressed,
      this.text,
      required this.highlightText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: text == null
            ? Text(
                highlightText,
                style: AppTextStyles.h2HighlightBold
                    .copyWith(fontSize: 16, color: Colors.black),
              )
            : RichText(
                text: TextSpan(
                    text: text,
                    style: AppTextStyles.h2
                        .copyWith(fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: highlightText,
                        style: AppTextStyles.h2HighlightBold
                            .copyWith(fontSize: 16, color: Colors.black),
                      )
                    ]),
              ),
      ),
    );
  }
}
