import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/shared/widgets/error_page.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('[WIDGETS TEST] - ErrorPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const ErrorPage(),
      ));

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
      final column = find.byType(Column);
      expect(column, findsWidgets);
      final sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsNWidgets(4));
    });
  });
}
