import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object> get props => null;
}

class ErrorLoginState extends LoginState {
  final errorMsg;

  ErrorLoginState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class GotoHomeState extends LoginState {
  @override
  List<Object> get props => [];
}

class GotoForgotPassState extends LoginState {
  @override
  List<Object> get props => [];
}

class GotoFaceIDLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class GotoSocialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class GotoSignUpLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class FacenotRecognizedLoginState extends LoginState {
  @override
  List<Object> get props => [];
}
