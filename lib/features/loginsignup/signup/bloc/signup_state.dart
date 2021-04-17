import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class InitialSignupState extends SignupState {
  @override
  List<Object> get props => [];
}

class ErrorState extends SignupState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class LoadingSignupState extends SignupState {
  @override
  List<Object> get props => null;
}

class SignupSuccessState extends SignupState {
  @override
  List<Object> get props => null;
}
