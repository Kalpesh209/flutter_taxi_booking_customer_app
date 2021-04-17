import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import 'bloc.dart';

class OptBloc extends Bloc<OptEvent, OptState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  OptState get initialState => InitialOptState();

  @override
  Stream<OptState> mapEventToState(
    OptEvent event,
  ) async* {
    //Loading indicator for something going to change
//    yield LoadingQuoteState();

    if (await _repo.networkInfo.isConnected) {
      if (event is VerifyOTPEvent) {
        try {
          yield GotoResetPassState();
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
