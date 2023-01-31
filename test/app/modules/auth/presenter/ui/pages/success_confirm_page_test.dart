import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/pages/success_confirm_page.dart';
import 'package:mauafood_front/app/modules/auth/presenter/ui/widgets/button_widget.dart';
import 'package:mauafood_front/generated/l10n.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets(
      '[WIDGETS TEST] - SuccessConfirmPage must show widgets in bloc states',
      (widgetTester) async {
    mockNetworkImagesFor(() async {});
    await widgetTester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SuccessConfirmPage(),
      ),
    );
    final image = find.byType(Image);
    expect(image, findsOneWidget);

    final text = find.byType(Text);
    expect(text, findsNWidgets(2));
    final column = find.byType(Column);
    expect(column, findsNWidgets(1));
    final button = find.byType(ButtonWidget);
    expect(button, findsNWidgets(1));
  });
}
