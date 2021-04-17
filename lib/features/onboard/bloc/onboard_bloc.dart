import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';


import './bloc.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  RepoProvider _repoProvider = GetIt.instance.get<RepoProvider>();
  int currentIndex = -1;
  int maxOnBoard = 2;

  @override
  OnboardState get initialState => InitialOnboardState();

  @override
  Stream<OnboardState> mapEventToState(
    OnboardEvent event,
  ) async* {
    //Loading indicator for something going to change
//    yield LoadingOnboardState();

    if (await _repoProvider.networkInfo.isConnected) {
      if (event is NextEvent) {
        try {
          if (currentIndex >= maxOnBoard) {
            //Goto Login
            yield GotoLoginOnboardState();
          } else {
            ++currentIndex;
            yield CurrentOnboardState(currentIndex: currentIndex);
          }
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      } else if (event is GoToLoginEvent) {
        //Goto Login
        yield GotoLoginOnboardState();
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }
  }
}
