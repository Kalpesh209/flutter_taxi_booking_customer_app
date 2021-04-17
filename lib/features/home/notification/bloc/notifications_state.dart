import 'package:equatable/equatable.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();
}

class InitialNotificationsState extends NotificationsState {
  @override
  List<Object> get props => [];
}
