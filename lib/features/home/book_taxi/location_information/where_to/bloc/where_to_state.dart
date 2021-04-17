import 'package:equatable/equatable.dart';

abstract class WhereToState extends Equatable {
  const WhereToState();
}

class InitialWhereToState extends WhereToState {
  @override
  List<Object> get props => [];
}
