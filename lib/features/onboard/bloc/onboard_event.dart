import 'package:equatable/equatable.dart';

abstract class OnboardEvent extends Equatable {
  const OnboardEvent();
}

class NextEvent extends OnboardEvent {
  @override
  List<Object> get props => null;
}

class GoToLoginEvent extends OnboardEvent {
  @override
  List<Object> get props => null;
}
