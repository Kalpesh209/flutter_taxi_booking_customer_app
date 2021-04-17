import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class FeelGoodBloc extends Bloc<FeelGoodEvent, FeelGoodState> {
  @override
  FeelGoodState get initialState => InitialFeelGoodState();

  @override
  Stream<FeelGoodState> mapEventToState(
    FeelGoodEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
