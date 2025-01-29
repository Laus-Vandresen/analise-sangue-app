import 'package:analise_sangue_mobile/http/webclient.dart';
import 'package:dio/dio.dart';

class LoginWebClient {

  static const String baseUrl = '192.168.105.1:8080';

  Future<Response> login(String nome, String senha) async {
      Uri url = Uri.http(baseUrl, '/usuario/login');
      return await WebClient.client.post(url.toString(), data: {'nome': nome, 'senha': senha});
  }
}