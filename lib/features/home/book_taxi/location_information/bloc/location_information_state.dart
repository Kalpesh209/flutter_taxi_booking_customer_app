import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocationInformationState extends Equatable {
  const LocationInformationState();
}

class InitialLocationInformationState extends LocationInformationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LocationInformationState {
  @override
  List<Object> get props => null;
}

class ErrorState extends LocationInformationState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ShowAddLocationState extends LocationInformationState {
  @override
  List<Object> get props => null;
}

class ShowGoodToSeeYouState extends LocationInformationState {
  @override
  List<Object> get props => null;
}

class ShowNextButton extends LocationInformationState {
  @override
  List<Object> get props => null;
}
