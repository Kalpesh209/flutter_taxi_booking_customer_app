import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  @override
  ResetPassState get initialState => InitialResetPassState();

  @override
  Stream<ResetPassState> mapEventToState(
    ResetPassEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
