import 'package:flutter/material.dart';
import 'package:mauafood_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../shared/themes/app_colors.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlueColor,
        body: Container(
          margin: const EdgeInsets.only(top: 60),
          child: Stack(children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              margin: const EdgeInsets.only(top: 100.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 100.0),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Text('Meus Dados',
                                        style: AppTextStyles.h2HighlightBold
                                            .copyWith(fontSize: 30.0))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text('Nome Completo',
                                      style: AppTextStyles.h2Highlight),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 10.0,
                                    ),
                                    child: Text('Nome Completo',
                                        style: AppTextStyles.h2),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text('CPF',
                                      style: AppTextStyles.h2Highlight),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 10.0,
                                    ),
                                    child: Text('CPF', style: AppTextStyles.h2),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text('E-mail',
                                      style: AppTextStyles.h2Highlight),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      top: 10.0,
                                    ),
                                    child:
                                        Text('E-mail', style: AppTextStyles.h2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 150.0),
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 84, backgroundColor: AppColors.letterThinColor),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
