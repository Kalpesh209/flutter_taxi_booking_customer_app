import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/pref_manager.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import 'bloc.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  PrefManager pref;
  RepoProvider repoProvider = GetIt.instance.get<RepoProvider>();

  LandingBloc() {
    initPref();
  }

  initPref() async {
    pref = await PrefManager.getInstance();
  }

  @override
  LandingState get initialState => LandingInitialState();

  @override
  Stream<LandingState> mapEventToState(
    LandingEvent event,
  ) async* {
    //Loading indicator for something going to change
    yield LandingLoadingState();

    if (event is LandingIsGuest) {
      try {
//        var random = Random();
        if (pref.isLogin) {
          //Navigate to language selection screen.
          yield LandingGoToUser();
        } else {
//          pref.isLogin = !pref.isLogin;
//          await repoProvider.apiProvider.downloadLanFile("en");

          //Navigate to guest screen.
          yield LandingGoToGuest();
        }
      } on Error {
        yield ErrorState(errorMsg: "Something went wrong");
      }
    }
  }
}
