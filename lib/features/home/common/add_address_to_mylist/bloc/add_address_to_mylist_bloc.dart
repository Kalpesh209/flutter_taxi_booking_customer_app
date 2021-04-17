import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddAddressToMylistBloc extends Bloc<AddAddressToMylistEvent, AddAddressToMylistState> {
  @override
  AddAddressToMylistState get initialState => InitialAddAddressToMylistState();

  @override
  Stream<AddAddressToMylistState> mapEventToState(
    AddAddressToMylistEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
