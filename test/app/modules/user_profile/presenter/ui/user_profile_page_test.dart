import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/profile/presenter/ui/user/pages/user_profile_page.dart';

void main() {
  testWidgets('[WIDGETS TESTS] - USER_PROFILE_PAGE', (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: UserProfilePage()));

    final sizedbox = find.byType(SizedBox);
    expect(sizedbox, findsNWidgets(5));

    final text = find.byType(Text);
    expect(text, findsNWidgets(7));

    final container = find.byType(Container);
    expect(container, findsNWidgets(8));

    final padding = find.byType(Padding);
    expect(padding, findsNWidgets(18));

    final column = find.byType(Column);
    expect(column, findsOneWidget);

    final singlechildscrollview = find.byType(SingleChildScrollView);
    expect(singlechildscrollview, findsOneWidget);

    final stack = find.byType(Stack);
    expect(stack, findsNWidgets(2));

    final scaffold = find.byType(Scaffold);
    expect(scaffold, findsOneWidget);

    final materialapp = find.byType(MaterialApp);
    expect(materialapp, findsOneWidget);

    final boxDecoration = find.byType(BoxDecoration);
    expect(boxDecoration, findsNothing);

    final circleAvatar = find.byType(CircleAvatar);
    expect(circleAvatar, findsNWidgets(2));
  });
}
