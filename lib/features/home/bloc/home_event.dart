import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class CheckLocPer extends HomeEvent {
  @override
  List<Object> get props => null;
}

class AskLocationDialogEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}
