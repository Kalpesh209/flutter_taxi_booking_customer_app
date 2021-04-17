import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_taxi_booking_customer_app/repo/repo_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';


import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepoProvider _repo = GetIt.instance.get<RepoProvider>();

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    //Loading indicator for something going to change
//    yield LoadingHomeState();

    if (event is CheckLocPer) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.locationAlways);

      if (permission == PermissionStatus.denied) {
        yield AskLocationDialog();
      }
    } else if (event is AskLocationDialogEvent) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

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
