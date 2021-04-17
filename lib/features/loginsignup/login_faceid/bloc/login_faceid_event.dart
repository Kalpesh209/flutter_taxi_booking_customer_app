import 'package:equatable/equatable.dart';

abstract class LoginFaceidEvent extends Equatable {
  const LoginFaceidEvent();
}

class UserFaceidEvent extends LoginFaceidEvent {
  UserFaceidEvent();

  @override
  List<Object> get props => null;
}
