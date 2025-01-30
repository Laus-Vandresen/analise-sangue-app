import 'package:analise_sangue_mobile/model/arquivo.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ImporteArquivoState {
  const ImporteArquivoState();
}

@immutable
class InitImporteArquivoState extends ImporteArquivoState {
  const InitImporteArquivoState();
}

@immutable
class GoToSignInState extends ImporteArquivoState {
  const GoToSignInState();
}

@immutable
class GoToVisualizarDadosState extends ImporteArquivoState {
  final int idArquivo;
  final List<Arquivo> arquivos;

  const GoToVisualizarDadosState({required this.idArquivo, required this.arquivos});
}

@immutable
class LoadedImporteArquivoState extends ImporteArquivoState {
  final List<Arquivo> arquivos;

  const LoadedImporteArquivoState({required this.arquivos});
}