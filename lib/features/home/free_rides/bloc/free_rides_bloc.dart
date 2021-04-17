import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class FreeRidesBloc extends Bloc<FreeRidesEvent, FreeRidesState> {
  @override
  FreeRidesState get initialState => InitialFreeRidesState();

  @override
  Stream<FreeRidesState> mapEventToState(
    FreeRidesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
