import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class SendOTPEvent extends ForgotPasswordEvent {
  final String mobileNo;

  SendOTPEvent(this.mobileNo);

  @override
  List<Object> get props => [mobileNo];
}
