import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class LoyaltyProgramBloc
    extends Bloc<LoyaltyProgramEvent, LoyaltyProgramState> {
  @override
  LoyaltyProgramState get initialState => InitialLoyaltyProgramState();

  @override
  Stream<LoyaltyProgramState> mapEventToState(
    LoyaltyProgramEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
