import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class GeneralMsgError extends Failure {
  final errorMsg;

  GeneralMsgError(this.errorMsg);

  @override
  List<Object> get props => errorMsg;
}
