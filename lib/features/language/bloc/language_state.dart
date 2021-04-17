import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class InitialLanguageState extends LanguageState {
  @override
  List<Object> get props => [];
}

class GoToOnBoardState extends LanguageState {
  @override
  List<Object> get props => [];
}

class LoadingLanState extends LanguageState {
  @override
  List<Object> get props => null;
}

class ErrorState extends LanguageState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
