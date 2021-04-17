import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import './bloc.dart';

class LoginFaceidBloc extends Bloc<LoginFaceidEvent, LoginFaceidState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  LoginFaceidState get initialState => InitialLoginFaceidState();

  @override
  Stream<LoginFaceidState> mapEventToState(
    LoginFaceidEvent event,
  ) async* {
    //Loading indicator for something going to change
//    yield LoadingLoginfaceidState();

    if (await _repo.networkInfo.isConnected) {
      if (event is UserFaceidEvent) {
        try {
          yield LoadingInfoLoginFaceidState();

          await Future.delayed(
            const Duration(seconds: 3),
          );

          yield AllowFaceidLoginFaceidState();
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
