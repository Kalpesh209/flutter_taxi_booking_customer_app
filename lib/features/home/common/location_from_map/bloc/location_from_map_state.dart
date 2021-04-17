import 'package:equatable/equatable.dart';

abstract class LocationFromMapState extends Equatable {
  const LocationFromMapState();
}

class InitialLocationFromMapState extends LocationFromMapState {
  @override
  List<Object> get props => [];
}
