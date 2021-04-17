import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginFaceidState extends Equatable {
  const LoginFaceidState();
}

class InitialLoginFaceidState extends LoginFaceidState {
  @override
  List<Object> get props => [];
}

class AllowFaceidLoginFaceidState extends LoginFaceidState {
  @override
  List<Object> get props => [];
}

class LoadingInfoLoginFaceidState extends LoginFaceidState {
  @override
  List<Object> get props => [];
}

class ErrorState extends LoginFaceidState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
