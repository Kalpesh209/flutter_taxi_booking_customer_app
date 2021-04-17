import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/pref_manager.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import './bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  RepoProvider _repo = GetIt.instance.get<RepoProvider>();
  PrefManager _pref;

  LanguageBloc() {
    initPref();
  }

  initPref() async {
    _pref = await PrefManager.getInstance();
  }

  @override
  LanguageState get initialState => InitialLanguageState();

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    //Loading indicator for something going to change
    yield LoadingLanState();

    if (await _repo.networkInfo.isConnected) {
      if (event is SelectLanEvent) {
        try {
          _pref.defaultLan = event.lan;
          _pref.defaultLanCode = event.lanCode;

          //Goto OnBoard Screen
          yield GoToOnBoardState();
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
