import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/shared/utils/utils.dart';

class ErrorPage extends StatelessWidget{
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Utils.height(context) / 4,
          ),
          SizedBox(
            height: Utils.height(context) /3,
            width: Utils.height(context)/2,
            child: Image.asset('assets/images/logos/grey_logo.png'),

          ),
          SizedBox(
            height: Utils.height(context) /20,
          ),
          const Text("Erro 404! Algo de errado aconteceu :(", style: TextStyle(fontSize: 16),),
          SizedBox(
            height: Utils.height(context) /20,
          ),

          ElevatedButton(onPressed: () => Modular.to.navigate('/'), child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Recarregar", style: TextStyle(fontSize: 24) ,),
          ))
        ],
      ),
    );
  }

}