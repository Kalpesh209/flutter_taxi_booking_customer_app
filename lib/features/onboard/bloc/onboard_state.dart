import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OnboardState extends Equatable {
  const OnboardState();
}

class InitialOnboardState extends OnboardState {
  @override
  List<Object> get props => [];
}

class CurrentOnboardState extends OnboardState {
  final currentIndex;

  CurrentOnboardState({
    @required this.currentIndex,
  });

  @override
  List<Object> get props => [currentIndex];
}

class LoadingOnboardState extends OnboardState {
  @override
  List<Object> get props => null;
}

class GotoLoginOnboardState extends OnboardState {
  @override
  List<Object> get props => null;
}

class ErrorState extends OnboardState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
