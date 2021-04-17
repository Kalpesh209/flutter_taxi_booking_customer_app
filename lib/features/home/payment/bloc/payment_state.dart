import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
}

class InitialPaymentState extends PaymentState {
  @override
  List<Object> get props => [];
}
