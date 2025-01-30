import 'package:analise_sangue_mobile/http/webclient.dart';
import 'package:dio/dio.dart';

class LoginWebClient {

  Future<Response> login(String nome, String senha) async {
      Uri url = Uri.http(WebClient.baseUrl, '/usuario/login');
      return await WebClient.client.post(url.toString(), data: {'nome': nome, 'senha': senha});
  }
}