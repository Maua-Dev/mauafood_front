import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mauafood_front/app/modules/auth/auth_module.dart';

import '../../../../shared/infra/user_roles_enum.dart';
import '../../../auth/presenter/bloc/auth/auth_bloc.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<LoadingEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<LoadingEvent>(_onLoading);
  }

  FutureOr<void> _onLoading(
      LoadingEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashSuccessState());
    await Modular.isModuleReady<AuthModule>();
    var controller = Modular.get<AuthBloc>();
    if (controller.userRole == UserRolesEnum.employee_h ||
        controller.userRole == UserRolesEnum.employee_biba) {
      Modular.to.pushNamed('/employee/',
          arguments: controller.userRole!.restaurantEnum);
    } else {
      Modular.to.pushNamed('/user/');
    }
  }
}
