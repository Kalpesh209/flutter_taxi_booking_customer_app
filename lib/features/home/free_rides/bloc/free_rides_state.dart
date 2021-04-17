import 'package:equatable/equatable.dart';

abstract class FreeRidesState extends Equatable {
  const FreeRidesState();
}

class InitialFreeRidesState extends FreeRidesState {
  @override
  List<Object> get props => [];
}
