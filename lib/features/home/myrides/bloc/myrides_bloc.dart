import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class MyridesBloc extends Bloc<MyridesEvent, MyridesState> {
  @override
  MyridesState get initialState => InitialMyridesState();

  @override
  Stream<MyridesState> mapEventToState(
    MyridesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
