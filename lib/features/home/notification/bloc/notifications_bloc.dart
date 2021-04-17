import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  @override
  NotificationsState get initialState => InitialNotificationsState();

  @override
  Stream<NotificationsState> mapEventToState(
    NotificationsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
