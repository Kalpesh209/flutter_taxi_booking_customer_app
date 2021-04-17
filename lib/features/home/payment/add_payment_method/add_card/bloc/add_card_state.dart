import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddCardState extends Equatable {
  const AddCardState();
}

class InitialAddCardState extends AddCardState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AddCardState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}


class LoadingAddCardState extends AddCardState {
  @override
  List<Object> get props => null;
}