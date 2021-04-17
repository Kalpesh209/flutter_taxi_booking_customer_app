import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/pref_manager.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';

import './bloc.dart';

class LocationInformationBloc
    extends Bloc<LocationInformationEvent, LocationInformationState> {
  PrefManager _pref;
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  LocationInformationBloc() {
    initPref();
  }

  initPref() async {
    _pref = await PrefManager.getInstance();
  }

  @override
  LocationInformationState get initialState =>
      InitialLocationInformationState();

  @override
  Stream<LocationInformationState> mapEventToState(
    LocationInformationEvent event,
  ) async* {
    //Loading indicator for something going to change
    yield LoadingState();

    if (event is IsLocationSelFinish) {
      if (event.flag) {
        yield ShowNextButton();
      } else {
        if (_pref.oncePromptAddLoc) {
          yield ShowGoodToSeeYouState();
        } else {
          yield ShowAddLocationState();
          _pref.oncePromptAddLoc = true;
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }

    /*if (event is OncePromptAddLocation) {
      if (_pref.oncePromptAddLoc) {
        yield ShowGoodToSeeYouState();
      } else {
        yield ShowAddLocationState();
        _pref.oncePromptAddLoc = true;
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }*/

    /*if (await _repo.networkInfo.isConnected) {
      if (event is GetNewQuote) {
        try {
          var failOrQuoteDetails = await repo.apiProvider.getNewQuote();
          yield failOrQuoteDetails.fold(
                (failure) =>
                ErrorState(errorMsg: (failure as GeneralMsgError).errorMsg),
                (quoteDetails) => DetailQuoteState(quoteDetails: quoteDetails),
          );
        } on Error {
          yield ErrorState(errorMsg: "Something went wrong");
        }
      }
    } else {
      yield ErrorState(errorMsg: "Connect with working internet...");
    }*/
  }
}
