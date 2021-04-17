import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SubmitSignupEvent extends SignupEvent {
  @override
  List<Object> get props => null;
}
