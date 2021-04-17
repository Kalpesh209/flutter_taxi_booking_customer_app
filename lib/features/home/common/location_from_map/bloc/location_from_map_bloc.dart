import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocationFromMapBloc extends Bloc<LocationFromMapEvent, LocationFromMapState> {
  @override
  LocationFromMapState get initialState => InitialLocationFromMapState();

  @override
  Stream<LocationFromMapState> mapEventToState(
    LocationFromMapEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
