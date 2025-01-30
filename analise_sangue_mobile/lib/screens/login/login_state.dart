import 'package:flutter/material.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

@immutable
class InitLoginState extends LoginState {
  const InitLoginState();
}

@immutable
class GoToSignUpState extends LoginState {
  const GoToSignUpState();
}

@immutable
class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

@immutable
class DoneLoginState extends LoginState {
  const DoneLoginState();
}