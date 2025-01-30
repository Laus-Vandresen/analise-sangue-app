import 'package:analise_sangue_mobile/components/bloc_container.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_cubit.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_state.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_view.dart';
import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ImporteArquivoContainer extends BlocContainer {
  const ImporteArquivoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ImporteArquivoCubit>(
        create: (context) => ImporteArquivoCubit(),
        child: BlocListener<ImporteArquivoCubit, ImporteArquivoState>(
          listener: (context, state) {
            if (state is GoToSignInState) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginContainer()),
              );
            }
            if (state is GoToVisualizarDadosState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisualizarDadosContainer(),
                  settings: RouteSettings(arguments: {'arquivoId': state.idArquivo}),
                ),
              );
            }
          },
          child: ImporteArquivoView(),
        ),
      ),
    );
  }
}