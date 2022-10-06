import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/app_widget.dart';

main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppWidget());
  });
}
