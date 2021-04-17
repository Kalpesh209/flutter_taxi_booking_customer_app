import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RidePersonalProfileBloc extends Bloc<RidePersonalProfileEvent, RidePersonalProfileState> {
  @override
  RidePersonalProfileState get initialState => InitialRidePersonalProfileState();

  @override
  Stream<RidePersonalProfileState> mapEventToState(
    RidePersonalProfileEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
