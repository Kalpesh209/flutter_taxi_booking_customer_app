import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ResetPassState extends Equatable {
  const ResetPassState();
}

class InitialResetPassState extends ResetPassState {
  @override
  List<Object> get props => [];
}

class LoadingResetPassState extends ResetPassState {
  @override
  List<Object> get props => null;
}

class ErrorState extends ResetPassState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
