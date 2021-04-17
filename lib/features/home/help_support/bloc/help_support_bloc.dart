import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class HelpSupportBloc extends Bloc<HelpSupportEvent, HelpSupportState> {
  @override
  HelpSupportState get initialState => InitialHelpSupportState();

  @override
  Stream<HelpSupportState> mapEventToState(
    HelpSupportEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
