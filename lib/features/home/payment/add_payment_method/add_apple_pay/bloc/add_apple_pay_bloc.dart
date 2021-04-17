import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddApplePayBloc extends Bloc<AddApplePayEvent, AddApplePayState> {
  @override
  AddApplePayState get initialState => InitialAddApplePayState();

  @override
  Stream<AddApplePayState> mapEventToState(
    AddApplePayEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
