import 'package:equatable/equatable.dart';

abstract class OptEvent extends Equatable {
  const OptEvent();
}

class VerifyOTPEvent extends OptEvent {
  @override
  List<Object> get props => null;
}
