import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class AskLocationDialog extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object> get props => null;
}

class ErrorState extends HomeState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
