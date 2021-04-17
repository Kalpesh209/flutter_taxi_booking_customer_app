import 'package:equatable/equatable.dart';

abstract class FeelGoodState extends Equatable {
  const FeelGoodState();
}

class InitialFeelGoodState extends FeelGoodState {
  @override
  List<Object> get props => [];
}
