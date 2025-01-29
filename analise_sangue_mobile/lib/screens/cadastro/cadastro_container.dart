import 'package:analise_sangue_mobile/components/bloc_container.dart';
import 'package:analise_sangue_mobile/screens/cadastro/cadastro_cubit.dart';
import 'package:analise_sangue_mobile/screens/cadastro/cadastro_state.dart';
import 'package:analise_sangue_mobile/screens/cadastro/cadastro_view.dart';
import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:analise_sangue_mobile/screens/login/login_cubit.dart';
import 'package:analise_sangue_mobile/screens/login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CadastroContainer extends BlocContainer {
  CadastroContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CadastroCubit>(
        create: (context) => CadastroCubit(),
        child: BlocListener<CadastroCubit, CadastroState>(
          listener: (context, state) {
            if (state is GoToSignInState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginContainer()),
              );
            }
          },
          child: CadastroView(),
        ),
      ),
    );
  }
}
