import 'package:analise_sangue_mobile/http/webclients/cadastro_webclient.dart';
import 'package:analise_sangue_mobile/screens/cadastro/cadastro_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroCubit extends Cubit<CadastroState> {
  CadastroWebClient webClient = CadastroWebClient();

  CadastroCubit(): super(const InitCadastroState());

  handleLogin() {
    emit(const GoToSignInState());
  }

  cadastrar(String nome, String senha) async {
    await webClient.cadastrar(nome, senha);
    handleLogin();
  }

}