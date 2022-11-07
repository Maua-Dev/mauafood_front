import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/error/presenter/ui/error_page.dart';
import 'package:mauafood_front/app/shared/modules/error/error_loading_menu_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  testWidgets('[WIDGETS TEST] - ErrorPage', (widgetTester) async {
    mockNetworkImagesFor(() async {
      await widgetTester.pumpWidget(const MaterialApp(
        home: ErrorPage(
          errorMessage: 'Page not found! :(',
        ),
      ));

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);
      final errorWidget = find.byType(ErrorLoadingMenuWidget);
      expect(errorWidget, findsOneWidget);
    });
  });
}
