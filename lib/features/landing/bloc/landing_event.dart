import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();
}

class LandingIsGuest extends LandingEvent {
  @override
  List<Object> get props => null;
}
