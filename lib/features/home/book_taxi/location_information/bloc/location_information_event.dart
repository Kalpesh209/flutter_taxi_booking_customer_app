import 'package:equatable/equatable.dart';

abstract class LocationInformationEvent extends Equatable {
  const LocationInformationEvent();
}

class OncePromptAddLocation extends LocationInformationEvent {
  @override
  List<Object> get props => null;
}

class IsLocationSelFinish extends LocationInformationEvent {
  final bool flag;

  IsLocationSelFinish({this.flag = false});

  @override
  List<Object> get props => null;
}
