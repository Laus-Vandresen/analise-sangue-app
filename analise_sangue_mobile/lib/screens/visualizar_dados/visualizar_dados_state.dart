import 'package:analise_sangue_mobile/enum/tipo_card_enum.dart';
import 'package:flutter/material.dart';

@immutable
abstract class VisualizarDadosState {
  const VisualizarDadosState();
}

@immutable
class InitVisualizarDadosState extends VisualizarDadosState {
  const InitVisualizarDadosState();
}

@immutable
class GoToSignInState extends VisualizarDadosState {
  const GoToSignInState();
}

@immutable
class VisualizarDadosLoading extends VisualizarDadosState {
  final TipoCardEnum tipoCard;

  const VisualizarDadosLoading({required this.tipoCard});
}

@immutable
class VisualizarDadosLoaded extends VisualizarDadosState {
  final TipoCardEnum tipoCard;
  final List<dynamic> data;

  const VisualizarDadosLoaded({required this.tipoCard, required this.data});
}
