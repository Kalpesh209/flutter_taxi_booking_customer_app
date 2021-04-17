import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class InitialForgotPasswordState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class LoadingForgotState extends ForgotPasswordState {
  @override
  List<Object> get props => null;
}

class GotoOTPSendState extends ForgotPasswordState {
  final String mobileNo;

  GotoOTPSendState(this.mobileNo);

  @override
  List<Object> get props => null;
}

class ErrorState extends ForgotPasswordState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
