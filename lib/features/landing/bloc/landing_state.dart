import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LandingState extends Equatable {
  const LandingState();
}

class LandingInitialState extends LandingState {
  @override
  List<Object> get props => [];
}

class LandingLoadingState extends LandingState {
  @override
  List<Object> get props => null;
}

class LandingGoToGuest extends LandingState {
  @override
  List<Object> get props => null;
}

class LandingGoToUser extends LandingState {
  @override
  List<Object> get props => null;
}

class ErrorState extends LandingState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
