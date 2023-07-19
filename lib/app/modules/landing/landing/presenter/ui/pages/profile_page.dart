import 'package:flutter/material.dart';
import 'package:mauafood_front/app/modules/menu/presenter/ui/user/widgets/contact/contact_dialog.dart';
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

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
                context: context, builder: (context) => const ContactDialog());
          },
          child: const Icon(Icons.mail),
        ),
      ),
      body: Container(color: Colors.black,),
    );
  }
}