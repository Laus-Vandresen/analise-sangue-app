import 'dart:convert';

import 'package:analise_sangue_mobile/http/webclient.dart';
import 'package:analise_sangue_mobile/model/arquivo.dart';

class ImporteArquivoWebclient {

  Future<void> importar(String nomeArquivo, List<Map<String, dynamic>> doadores) async {
    Uri url = Uri.http(WebClient.baseUrl, 'arquivo/importar');
    var requestData = {
      'nomeArquivo': nomeArquivo,
      'doadores': doadores,
    };
    await WebClient.clientAuth.post(url.toString(), data: requestData);
  }

  Future<List<Arquivo>> buscaArquivosUsuario() async {
    Uri url = Uri.http(WebClient.baseUrl, 'arquivo');
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
        return (response.data as List).map((item) => Arquivo.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }
}