import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/widget_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const WidgetPage());

    expect(find.byType(Container), findsOneWidget);
  });
}
