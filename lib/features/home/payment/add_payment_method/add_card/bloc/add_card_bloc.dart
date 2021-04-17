import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  @override
  AddCardState get initialState => InitialAddCardState();

  @override
  Stream<AddCardState> mapEventToState(
    AddCardEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
