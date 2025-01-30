import 'dart:convert';
import 'dart:io';

import 'package:analise_sangue_mobile/http/webclients/importe_arquivo_webclient.dart';
import 'package:analise_sangue_mobile/model/arquivo.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ImporteArquivoCubit extends Cubit<ImporteArquivoState> {
  ImporteArquivoWebclient webclient = ImporteArquivoWebclient();
  List<Arquivo>? arquivos;

  ImporteArquivoCubit(): super(const InitImporteArquivoState()) {
    buscaArquivosUsuario();
  }

  handleUploadArquivo(File file) async {
    var nomeArquivo = file.uri.pathSegments.last;
    String fileContent = await file.readAsString();
    try {
      List<dynamic> doadores = json.decode(fileContent);
      List<Map<String, dynamic>> doadoresMap = List<Map<String, dynamic>>.from(doadores);
      await webclient.importar(nomeArquivo, doadoresMap);
      buscaArquivosUsuario();
    } catch (e) {
      print("Erro ao decodificar o arquivo JSON: $e");
    }
  }

  String getDataPresente() {
    DateTime agora = DateTime.now();
    String dataFormatada = DateFormat('dd/MM/yyyy HH:mm:ss').format(agora);
    return dataFormatada;
  }

  buscaArquivosUsuario() async {
    var arquivos = await webclient.buscaArquivosUsuario();
    this.arquivos = arquivos;
    emit(LoadedImporteArquivoState(arquivos: arquivos));
  }

  handleVisualizarDadosState(int idArquivo) {
    emit(GoToVisualizarDadosState(idArquivo: idArquivo, arquivos: arquivos!));
  }

}