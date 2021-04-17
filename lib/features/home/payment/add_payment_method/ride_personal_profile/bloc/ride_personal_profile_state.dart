import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RidePersonalProfileState extends Equatable {
  const RidePersonalProfileState();
}

class InitialRidePersonalProfileState extends RidePersonalProfileState {
  @override
  List<Object> get props => [];
}

class LoadingState extends RidePersonalProfileState {
  @override
  List<Object> get props => null;
}

class ErrorState extends RidePersonalProfileState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
