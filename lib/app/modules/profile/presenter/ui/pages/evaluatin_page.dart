import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "package:mauafood_front/app/modules/profile/presenter/controllers/popup_controller.dart";
import 'package:mauafood_front/app/shared/themes/app_colors.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EvaluationPopup();
  }
 
}

class EvaluationPopup extends StatefulWidget{

  @override
  _EvaluationPopupState createState() => _EvaluationPopupState();
}

class _EvaluationPopupState extends State<EvaluationPopup> {
  final PopupStore popupStore = PopupStore();
  @override

  Widget build (BuildContext context){

    WidgetsBinding.instance.addPostFrameCallback((_){
      popupStore.togglePopup();
    });

    return Scaffold(
      body: Center(
        child:Observer(builder: (_){
          if (popupStore.showPopup){
            return AlertDialog(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              content:
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child:IconButton(
                        icon: const Icon(Icons.close_rounded),
                        iconSize: 40.0,
                        color: AppColors.mainBlueColor,
                        onPressed: (){},)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Nome do Resturante",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.letterColor,
                      ),)],
                    ),
                    const SizedBox(
                      height:20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Expanded(child: Text("Avalie o restaurante, seu feedback é importante!", style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.letterThinColor,
                      ),))
                        ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border_rounded,
                        size: 48.0,
                        color: AppColors.letterThinColor,),
                      ],
                    )
                  ],
                ),
              actions: [
                Center(
                  child: SizedBox(
                    width:180,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlueColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ), 
                    child: Text("OK", style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0
                    )
                                ,),),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )

              ],
            );
          } else {
            return const Text("Página carregada");
          }
        }),
      ),

    );
  }
}