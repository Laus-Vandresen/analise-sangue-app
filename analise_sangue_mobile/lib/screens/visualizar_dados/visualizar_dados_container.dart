import 'package:analise_sangue_mobile/components/bloc_container.dart';
import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_cubit.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_state.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class VisualizarDadosContainer extends BlocContainer {
  VisualizarDadosContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final int arquivoId = args?['arquivoId'];

    return Scaffold(
      body: BlocProvider<VisualizarDadosCubit>(
        create: (context) => VisualizarDadosCubit(arquivoId: arquivoId),
        child: BlocListener<VisualizarDadosCubit, VisualizarDadosState>(
          listener: (context, state) {
            if (state is GoToSignInState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginContainer()),
              );
            }
          },
          child: VisualizarDadosView(),
        ),
      ),
    );
  }
}