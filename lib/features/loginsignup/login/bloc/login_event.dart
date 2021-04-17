import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SubmitLoginEvent extends LoginEvent {
  final String mobile;
  final String password;

  SubmitLoginEvent(
    this.mobile,
    this.password,
  );

  @override
  List<Object> get props => [mobile, password];
}

class LoginWithFaceidEvent extends LoginEvent {
  @override
  List<Object> get props => null;
}

class ForgotPassEvent extends LoginEvent {
  @override
  List<Object> get props => null;
}
