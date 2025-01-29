import 'package:flutter/material.dart';

@immutable
abstract class CadastroState {
  const CadastroState();
}

@immutable
class InitCadastroState extends CadastroState {
  const InitCadastroState();
}

@immutable
class GoToSignInState extends CadastroState {
  const GoToSignInState();
}