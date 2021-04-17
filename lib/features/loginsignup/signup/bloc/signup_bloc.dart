import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import './bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  SignupState get initialState => InitialSignupState();

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    //Loading indicator for something going to change
    yield LoadingSignupState();

    if (await _repo.networkInfo.isConnected) {
      if (event is SubmitSignupEvent) {
        try {
          yield SignupSuccessState();
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
