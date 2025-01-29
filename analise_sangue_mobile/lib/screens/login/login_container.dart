import 'package:analise_sangue_mobile/components/bloc_container.dart';
import 'package:analise_sangue_mobile/screens/cadastro/cadastro_container.dart';
import 'package:analise_sangue_mobile/screens/login/login_cubit.dart';
import 'package:analise_sangue_mobile/screens/login/login_state.dart';
import 'package:analise_sangue_mobile/screens/login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoginContainer extends BlocContainer {
  LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is GoToSignUpState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroContainer()),
                );
              }
            },
            child: LoginView(),
          )),
    );
  }
}
