import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class HelpSupportQuestionsBloc extends Bloc<HelpSupportQuestionsEvent, HelpSupportQuestionsState> {
  @override
  HelpSupportQuestionsState get initialState => InitialHelpSupportQuestionsState();

  @override
  Stream<HelpSupportQuestionsState> mapEventToState(
    HelpSupportQuestionsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
