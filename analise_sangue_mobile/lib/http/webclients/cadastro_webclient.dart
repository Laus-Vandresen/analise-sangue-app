import 'package:analise_sangue_mobile/http/webclient.dart';

class CadastroWebClient {

  static const String baseUrl = '192.168.105.1:8080';

  Future<void> cadastrar(String nome, String senha) async {
    Uri url = Uri.http(baseUrl, '/usuario/cadastro');
    await WebClient.client.post(url.toString(), data: {'nome': nome, 'senha': senha});
  }
}