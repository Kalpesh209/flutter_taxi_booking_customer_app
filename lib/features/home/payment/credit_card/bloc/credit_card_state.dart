import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CreditCardState extends Equatable {
  const CreditCardState();
}

class InitialCreditCardState extends CreditCardState {
  @override
  List<Object> get props => [];
}

class ShowDeleteCardState extends CreditCardState {
  @override
  List<Object> get props => [];
}

class LoadingCreditCardState extends CreditCardState {
  @override
  List<Object> get props => null;
}

class ErrorState extends CreditCardState {
  final errorMsg;

  ErrorState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
