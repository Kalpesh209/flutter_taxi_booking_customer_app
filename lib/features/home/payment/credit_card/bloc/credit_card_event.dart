import 'package:equatable/equatable.dart';

abstract class CreditCardEvent extends Equatable {
  const CreditCardEvent();
}

class ClickOnDeleteEvent extends CreditCardEvent {
  @override
  List<Object> get props => null;
}
