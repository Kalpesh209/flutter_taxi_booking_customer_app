import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OptState extends Equatable {
  const OptState();
}

class InitialOptState extends OptState {
  @override
  List<Object> get props => [];
}

class LoadingOptState extends OptState {
  @override
  List<Object> get props => [];
}

class GotoResetPassState extends OptState {
  @override
  List<Object> get props => null;
}

class ErrorState extends OptState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
