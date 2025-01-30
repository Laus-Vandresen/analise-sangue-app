import 'dart:convert';

import 'package:analise_sangue_mobile/http/webclient.dart';

class VisualizarDadosWebclient {

  static const String baseUrl = '192.168.105.1:8080';

  Future<List<dynamic>> contarDoadoresPorEstado(int arquivoId) async {
    Uri url = Uri.http(baseUrl, '/doador/por-estado', {'arquivoId': arquivoId.toString()});
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> calcularImcMedioPorFaixaEtaria(int arquivoId) async {
    Uri url = Uri.http(baseUrl, '/doador/imc-faixa-etaria', {'arquivoId': arquivoId.toString()});
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> calcularPercentualObesosPorSexo(int arquivoId) async {
    Uri url = Uri.http(baseUrl, '/doador/obeso-sexo', {'arquivoId': arquivoId.toString()});
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> calcularMediaIdadePorTipoSanguineo(int arquivoId) async {
    Uri url = Uri.http(baseUrl, '/doador/idade-tipo-sanguineo', {'arquivoId': arquivoId.toString()});
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> contarDoadoresPorTipoSanguineoReceptor(int arquivoId) async {
    Uri url = Uri.http(baseUrl, '/doador/doadores-tipo-sanguineo-receptor', {'arquivoId': arquivoId.toString()});
    var response = await WebClient.clientAuth.get(url.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Falha ao buscar arquivos: ${response.statusCode}');
    }
  }
}