import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class WhereToBloc extends Bloc<WhereToEvent, WhereToState> {
  @override
  WhereToState get initialState => InitialWhereToState();

  @override
  Stream<WhereToState> mapEventToState(
    WhereToEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
