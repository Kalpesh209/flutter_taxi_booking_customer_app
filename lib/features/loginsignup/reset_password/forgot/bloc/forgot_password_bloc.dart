import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import './bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  ForgotPasswordState get initialState => InitialForgotPasswordState();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    //Loading indicator for something going to change
//        yield LoadingQuoteState();

    if (await _repo.networkInfo.isConnected) {
      if (event is SendOTPEvent) {
        try {
          yield GotoOTPSendState(event.mobileNo);
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
