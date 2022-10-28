import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/amplifyconfiguration.dart';
import 'package:mauafood_front/app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

Future configureAmplify() async {
  Amplify.addPlugins([AmplifyAuthCognito()]);

  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    // ignore: avoid_print
    print('Amplify is already configured');
  }
}
