import 'package:flutter/material.dart';

import 'package:mauafood_front/app/shared/themes/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../shared/widgets/contact/contact_dialog.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final _key = UniqueKey();
  var controller = WebViewController();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        }),
      )
      ..loadRequest(Uri.parse('https://faq.devmaua.com/mauafood/index.html'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 8),
          child: FloatingActionButton(
            backgroundColor: AppColors.mainBlueColor,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const ContactDialog());
            },
            child: const Icon(Icons.mail),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(key: _key, controller: controller),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ));
  }
}
