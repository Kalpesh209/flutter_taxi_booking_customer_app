import 'package:equatable/equatable.dart';

abstract class AddApplePayState extends Equatable {
  const AddApplePayState();
}

class InitialAddApplePayState extends AddApplePayState {
  @override
  List<Object> get props => [];
}
