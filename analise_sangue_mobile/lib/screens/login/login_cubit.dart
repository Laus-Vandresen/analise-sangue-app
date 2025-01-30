import 'package:analise_sangue_mobile/http/webclients/login_webclient.dart';
import 'package:analise_sangue_mobile/screens/login/login_state.dart';
import 'package:analise_sangue_mobile/util/shared_preferences_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginWebClient webClient = LoginWebClient();
  SharedPreferencesUtil sharedPreferences = SharedPreferencesUtil();

  LoginCubit() : super(const InitLoginState());

  handleCadastro() {
    emit(const GoToSignUpState());
  }

  logar(String nome, String senha) async {
    emit(const LoadingLoginState());
    Response response = await webClient.login(nome, senha);
    if (response.statusCode == 200) {
      sharedPreferences.save('jwt', response.data['jwt']);
      sharedPreferences.save('usuario', nome);
      emit(const DoneLoginState());
    } else {
      emit(const InitLoginState());
    }
  }
}
