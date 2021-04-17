import 'package:equatable/equatable.dart';

abstract class LoyaltyProgramState extends Equatable {
  const LoyaltyProgramState();
}

class InitialLoyaltyProgramState extends LoyaltyProgramState {
  @override
  List<Object> get props => [];
}
