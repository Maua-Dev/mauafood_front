import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mauafood_front/app/modules/splash/presenter/bloc/splash_bloc.dart';
import 'package:mauafood_front/app/modules/splash/presenter/ui/splash_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  late SplashBloc bloc;

  setUp(() {
    bloc = SplashBloc();
  });

  setUpAll(() {
    HttpOverrides.global = null;
  });
  testWidgets('[WIDGETS TEST] - SplashPage must show widgets in bloc states',
      (widgetTester) async {
    await mockNetworkImagesFor(() async {
      await widgetTester
          .runAsync(() async => await widgetTester.pumpWidget(MaterialApp(
                home: BlocProvider(
                  create: (context) => bloc,
                  child: const SplashPage(),
                ),
              )));

      final sizedbox = find.byType(SizedBox);
      expect(sizedbox, findsNothing);
      final image = find.byType(Image);
      expect(image, findsNothing);
      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      expect(circularProgressIndicator, findsOneWidget);

      await widgetTester.runAsync(() async => bloc.add(const LoadingEvent()));
      await widgetTester.pump();

      expect(sizedbox, findsOneWidget);
      expect(image, findsOneWidget);
    });
  });
}
