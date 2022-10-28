import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/infra/models/user_model.dart';
import 'package:mauafood_front/app/modules/auth/presenter/bloc/auth_bloc.dart';

import '../../../../../shared/themes/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var id = TextEditingController();
    var fullName = TextEditingController();
    var cpf = TextEditingController();
    var isStudent = false;
    var email = TextEditingController();
    var password = TextEditingController();
    var notifications = false;
    return Scaffold(
      body: BlocProvider(
        create: (context) => Modular.get<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: id,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor2), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'id',
                  ),
                ),
                TextField(
                  controller: fullName,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor2), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'fullName',
                  ),
                ),
                TextField(
                  controller: cpf,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor2), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'cpf',
                  ),
                ),
                Checkbox(
                  value: isStudent,
                  onChanged: (value) {
                    setState(() {
                      isStudent = value!;
                    });
                  },
                  mouseCursor: SystemMouseCursors.click,
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor2), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'email',
                  ),
                ),
                TextField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: AppColors.backgroundColor2), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    labelText: 'password',
                  ),
                ),
                Checkbox(
                  value: notifications,
                  onChanged: (value) {
                    setState(() {
                      notifications = value!;
                    });
                  },
                  mouseCursor: SystemMouseCursors.click,
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(const RegisterUser(
                          user: UserModel(
                        id: 0,
                        fullName: '',
                        cpf: '',
                        isStudent: true,
                        email: 'gabriel.godoybz@hotmail.com',
                        password: 'teste1',
                        notifications: true,
                      )));
                    },
                    icon: Icon(Icons.check))
              ],
            );
          },
        ),
      ),
    );
  }
}
