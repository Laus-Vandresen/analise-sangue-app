import 'package:analise_sangue_mobile/http/webclient.dart';

class CadastroWebClient {

  Future<void> cadastrar(String nome, String senha) async {
    Uri url = Uri.http(WebClient.baseUrl, '/usuario/cadastro');
    await WebClient.client.post(url.toString(), data: {'nome': nome, 'senha': senha});
  }
}