import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  @override
  PaymentState get initialState => InitialPaymentState();

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
