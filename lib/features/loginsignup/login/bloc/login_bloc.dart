import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    //Loading indicator for something going to change
//    yield LoadingQuoteState();

    if (await _repo.networkInfo.isConnected) {
      if (event is SubmitLoginEvent) {
        yield GotoHomeState();
      } else if (event is LoginWithFaceidEvent) {
        try {
          var random = Random();
          if (random.nextBool()) {
            yield GotoFaceIDLoginState();
          } else {
            yield FacenotRecognizedLoginState();
          }
        } on Error {
          yield ErrorLoginState(errorMsg: "Something went wrong");
        }
      } else if (event is ForgotPassEvent) {
        try {
          yield GotoForgotPassState();
        } on Error {
          yield ErrorLoginState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorLoginState(errorMsg: "Connect with working internet...");
    }
  }
}
